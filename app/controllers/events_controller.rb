class EventsController < ApplicationController
  before_action :set_event, only: [:show, :edit, :update, :destroy]

  # GET /events
  # GET /events.json
  def index
    events = Event.submitted
publishedEvents = Array.new
    events.each do |event|

    #This is defined in Event.state enum
    enumValue = 4
      kidsReadyToPublish = event.revisions.where("state = ?", enumValue)
      if kidsReadyToPublish.count > 0
        publishedEvents.push(kidsReadyToPublish.last)
      else
        if !event.parent.present?
        publishedEvents.push(event)
          end
    end
    end
    @events = publishedEvents
end
  # GET /events/1
  # GET /events/1.json
  def show
  end

  # GET /events/new
  def new
  redirect_to new_build_path
  end

  # GET /events/1/edit
  def edit
    if params[:only_me]
      @copy= @event.deep_clone( include: [:event_roles],except:[:state])
    else
@copy= @event.deep_clone( include: [:event_roles,{recurrence: [:rules,:excludes]}],except:[:state])
end
if @event.parent.blank?
@copy.parent = @event
else
  @copy.parent = @event.parent
  end
@copy.author = nil
@copy.message = nil
@copy.manager = nil
@copy.admin = nil
@copy.save!
session[:only_me] = params[:only_me]
 redirect_to make_copy_path(:event_id => @copy.id,:id => :build,:only_me => params[:only_me] ) and return
  end
#For the review action
  def review
@event = Event.find(params[:id])


  end
  #Shows all the events a manager can still permit
  def permittables
    @events = Event.waiting
  end
  #Shows all the items an admin can still publish
  def publishables
@events = Event.reviewed
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
    if ablehnen?
      @event.message = params[:event][:message]
      @event.manager_id = current_user.id
      @event.rejected!
      @event.save
      respond_to do |format|

          format.html { redirect_to root_path, notice: 'Eintrag wurde abgelehnt.' }
          end
    elsif genehmigen?
      @event.reviewed!
      @event.manager_id = current_user.id
      @event.save
      respond_to do |format|

        format.html { redirect_to root_path, notice: 'Eintrag wurde genehmigt.' }
      end
    elsif publizieren?
    @event.changeState(current_user)
    respond_to do |format|

      format.html { redirect_to root_path, notice: 'Eintrag wurde veröffentlicht.' }
    end
    else
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
    #Was this form submittted to reject the event?
    def ablehnen?
      params[:commit] == "Ablehnen"
    end
    #Was this form submitted to accept the event?
    def genehmigen?
      params[:commit] == "Genehmigen"
    end
  def publizieren?
    params[:commit] == "Veröffentlichen"
  end
end
