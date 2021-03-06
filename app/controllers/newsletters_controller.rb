class NewslettersController < ApplicationController
  before_action :set_newsletter, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  # GET /newsletters
  # GET /newsletters.json
  def index
    @newsletters = Newsletter.all
  end

  # GET /newsletters/1
  # GET /newsletters/1.json
  def show
  end

  # GET /newsletters/new
  def new
    authorize Newsletter
    @newsletter = Newsletter.new
  end

  # GET /newsletters/1/edit
  def edit
    authorize Newsletter
  end

  # POST /newsletters
  # POST /newsletters.json
  def create
    @newsletter = Newsletter.new(newsletter_params)
    @newsletter.unmanager_id = current_user.id
      respond_to do |format|
        if @newsletter.save
          @newsletter.notify_admin
          format.html { redirect_to @newsletter, notice: 'Newsletter wird nun zur Prüfung freigegeben' }
          format.json { render :show, status: :created, location: @newsletter }
        else
          format.html { render :new }
          format.json { render json: @newsletter.errors, status: :unprocessable_entity }
        end
    end
  end

  # PATCH/PUT /newsletters/1
  # PATCH/PUT /newsletters/1.json
  def update
    if publizieren?
      @newsletter.unadmin_id = current_user.id
      @newsletter.save
      @newsletter.send_newsletter
      respond_to do |format|
        format.html { redirect_to :publishables_newsletter, notice: 'Newsletter versandt.' }
      end
    elsif ablehnen?
      @newsletter.destroy
      @newsletter.notify_manager(1)
      respond_to do |format|
        format.html { redirect_to :publishables_newsletter, notice: 'Newsletter gelöscht' }
       end
    else
      respond_to do |format|
        if @newsletter.update(newsletter_params)
          format.html { redirect_to @newsletter, notice: 'Newsletter was successfully updated.' }
          format.json { render :show, status: :ok, location: @newsletter }
        else
          format.html { render :edit }
          format.json { render json: @newsletter.errors, status: :unprocessable_entity }
        end
      end
    end

  end

  # DELETE /newsletters/1
  # DELETE /newsletters/1.json
  def destroy
    authorize Newsletter
    @newsletter.destroy
    respond_to do |format|
      format.html { redirect_to newsletters_url, notice: 'Newsletter was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def publishables
    authorize Newsletter
    @newsletters = Newsletter.where("unadmin_id is null and unmanager_id is not null")
  end

  def review
    authorize Newsletter
    set_newsletter
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_newsletter
      @newsletter = Newsletter.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def newsletter_params
      params.require(:newsletter).permit(:subject, :description, :from, :to)
    end

  def ablehnen?
    params[:commit] == "Ablehnen"
  end

  def publizieren?
    params[:commit] == "Veröffentlichen"
  end

end
