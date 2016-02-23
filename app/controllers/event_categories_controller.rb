class EventCategoriesController < ApplicationController
  before_action :set_event_category, only: [:show, :edit, :update, :destroy]

  # GET /event_categories
  # GET /event_categories.json
  def index
    @event_categories = EventCategory.all
  end

  # GET /event_categories/1
  # GET /event_categories/1.json
  def show
  end

  # GET /event_categories/new
  def new
    @event_category = EventCategory.new
  end

  # GET /event_categories/1/edit
  def edit
  end

  # POST /event_categories
  # POST /event_categories.json
  def create
    @event_category = EventCategory.new(event_category_params)

    respond_to do |format|
      if @event_category.save
        format.html { redirect_to @event_category, notice: 'Event category was successfully created.' }
        format.json { render :show, status: :created, location: @event_category }
      else
        format.html { render :new }
        format.json { render json: @event_category.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /event_categories/1
  # PATCH/PUT /event_categories/1.json
  def update
    respond_to do |format|
      if @event_category.update(event_category_params)
        format.html { redirect_to @event_category, notice: 'Event category was successfully updated.' }
        format.json { render :show, status: :ok, location: @event_category }
      else
        format.html { render :edit }
        format.json { render json: @event_category.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /event_categories/1
  # DELETE /event_categories/1.json
  def destroy
    @event_category.destroy
    respond_to do |format|
      format.html { redirect_to event_categories_url, notice: 'Event category was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_event_category
      @event_category = EventCategory.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def event_category_params
      params.require(:event_category).permit(:name)
    end
end
