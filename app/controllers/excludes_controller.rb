class ExcludesController < ApplicationController
  before_action :set_exclude, only: [:show, :edit, :update, :destroy]

  # GET /excludes
  # GET /excludes.json
  def index
    @excludes = Exclude.all
  end

  # GET /excludes/1
  # GET /excludes/1.json
  def show
  end

  # GET /excludes/new
  def new
    @exclude = Exclude.new
  end

  # GET /excludes/1/edit
  def edit
  end

  # POST /excludes
  # POST /excludes.json
  def create
    @exclude = Exclude.new(exclude_params)

    respond_to do |format|
      if @exclude.save
        format.html { redirect_to @exclude, notice: 'Exclude was successfully created.' }
        format.json { render :show, status: :created, location: @exclude }
      else
        format.html { render :new }
        format.json { render json: @exclude.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /excludes/1
  # PATCH/PUT /excludes/1.json
  def update
    respond_to do |format|
      if @exclude.update(exclude_params)
        format.html { redirect_to @exclude, notice: 'Exclude was successfully updated.' }
        format.json { render :show, status: :ok, location: @exclude }
      else
        format.html { render :edit }
        format.json { render json: @exclude.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /excludes/1
  # DELETE /excludes/1.json
  def destroy
    @exclude.destroy
    respond_to do |format|
      format.html { redirect_to excludes_url, notice: 'Exclude was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_exclude
      @exclude = Exclude.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def exclude_params
      params.require(:exclude).permit(:date)
    end
end
