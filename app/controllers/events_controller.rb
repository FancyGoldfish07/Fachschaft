class EventsController < ApplicationController
  before_action :set_event, only: [:show, :edit, :update, :destroy]

  # GET /events
  # GET /events.json
  def index
    @events = Event.all
  end

  # GET /events/1
  # GET /events/1.json
  def show
  end

  # GET /events/new
  def new
    @event = Event.new
  end

  # GET /events/1/edit
  def edit
copy= @event.deep_clone( include: [:event_roles,{recurrence: [:rules,:excludes]}])
copy.parent = @event
copy.save!
#Yes this is super ugly, but I am a bit clueless here
 redirect_to "/events/#{copy.id}/build" and return
  end

  def review
@event = Event.find(params[:id])


  end
  # POST /events
  # POST /events.json
  def create
    @event = Event.new(event_params)

    respond_to do |format|
      if @event.save
        format.html { redirect_to @event, notice: 'Event was successfully created.' }
        format.json { render :show, status: :created, location: @event }
      else
        format.html { render :new }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /events/1
  # PATCH/PUT /events/1.json
  def update
    respond_to do |format|
      if @event.update(event_params)
        format.html { redirect_to @event, notice: 'Event was successfully updated.' }
        format.json { render :show, status: :ok, location: @event }
      else
        format.html { render :edit }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /events/1
  # DELETE /events/1.json
  def destroy
    @event.destroy
    respond_to do |format|
      format.html { redirect_to events_url, notice: 'Event was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
  #taken from wicked gem because I am too stupid to setup a proper route
  def wizard_path(goto_step = nil, options = {})
    options = { :controller => 'BuildController',
                :action     => 'show',
                :id         => goto_step || params[:id],
                :only_path  => true
    }.merge options
    url_for(options)
  end
    # Use callbacks to share common setup or constraints between actions.
    def set_event
      @event = Event.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def event_params
      params.require(:event).permit(:title,:recurrence_id,:event_category_id, :start, :priority, :flag, :imageURL, :url, :end, :ort, :description,role_ids: [])
    end
end
