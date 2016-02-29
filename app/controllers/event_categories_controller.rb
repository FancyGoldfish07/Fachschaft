class EventCategoriesController < ApplicationController
  before_action :set_event_category, only: [ :edit, :update, :destroy]

  # GET /event_categories
  # GET /event_categories.json
  def index
    authorize current_user
    @event_categories = EventCategory.all
  end

  # GET /event_categories/1
  # GET /event_categories/1.json
  def show
    id = params[:id]

    @events = Event.giveBackAllPublished
    if id.to_i > 0
      category = EventCategory.find(id)
      category_events = Array.new
      @events.each do |categoryevent|
        if categoryevent.event_category == category
          category_events.push(categoryevent)
        end
      end
      @events = category_events
  end
end


  # GET /event_categories/new
  def new
    authorize current_user
    @event_category = EventCategory.new
  end

  # GET /event_categories/1/edit
  def edit
    authorize current_user
  end



  # PATCH/PUT /event_categories/1
  # PATCH/PUT /event_categories/1.json
  def update
    authorize current_user
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
    authorize current_user
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
