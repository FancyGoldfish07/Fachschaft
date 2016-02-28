class EventsController < ApplicationController
  before_action :set_event, only: [:show, :edit, :update, :review, :unpublish]


  # GET /events/new
  def new
    redirect_to new_build_path
  end

  def show

  end

  #unpublish
  def unpublish

  end

  # GET /events/1/edit
  def edit
    copy= @event.deep_clone(include: [:event_roles, {recurrence: [:rules, :excludes]}], except: [:state])
    if @event.parent.blank?
      copy.parent = @event
    else
      copy.parent = @event.parent
    end
    copy.author = nil
    copy.message = nil
    copy.manager = nil
    copy.admin = nil
    copy.save!
    session[:no_save] = false
#Yes this is super ugly, but I am a bit clueless here
    redirect_to "/events/#{copy.id}/build" and return

  end

  #For the review action
  def review

  end

  #Shows all the events a manager can still permit
  def permittables
    @events = Event.waiting
  end

  #Shows all the items an admin can still publish
  def publishables
    @events = Event.reviewed
  end

  #unpublishables
  def unpublishables
    if current_user.present?
      if current_user.isAdmin
        #We are an admin
        @events = Event.submitted.where.not(unmanager_id: nil)
      end
      if current_user.isManager
        @events = Event.submitted.where.not(unadmin_id: nil)
      end
    end

  end

  # POST /events
  # POST /events.json
  def create
    @event = Event.new(event_params)

    respond_to do |format|
      if @event.save
        format.html { redirect_to @event, notice: 'Event wurde erfolgreich erstellt.' }
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

        format.html { redirect_to permittables_path, notice: 'Eintrag wurde abgelehnt.' }
      end
    elsif unpublizieren?
      if current_user.present?
        if current_user.isAdmin

          @event.unadmin = current_user
          if @event.unmanager.present?

            @event.unpublish_all
          end
        end
        if current_user.isManager
          @event.unmanager = current_user
          if @event.unadmin.present?
            @event.unpublish_all
          end
        end
        @event.save
        respond_to do |format|

          format.html { redirect_to unpublishables_path, notice: 'Löschung beantragt.' }
        end
      end
    elsif genehmigen?
      @event.reviewed!
      @event.manager_id = current_user.id
      @event.save
      respond_to do |format|

        format.html { redirect_to permittables_path, notice: 'Eintrag wurde genehmigt.' }
      end
    elsif publizieren?
      @event.changeState(current_user)
      respond_to do |format|

        format.html { redirect_to publishables_path, notice: 'Eintrag wurde veröffentlicht.' }
      end
    else
      respond_to do |format|
        if @event.update(event_params)
          format.html { redirect_to @event, notice: 'Event wurde erfolgreich bearbeitet.' }
          format.json { render :show, status: :ok, location: @event }
        else
          format.html { render :edit }
          format.json { render json: @event.errors, status: :unprocessable_entity }
        end
      end
    end
  end


  # Use callbacks to share common setup or constraints between actions.
  def set_event
    @event = Event.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def event_params
    params.require(:event).permit(:title, :recurrence_id, :event_category_id, :start, :priority, :flag, :imageURL, :url, :end, :ort, :description, role_ids: [])
  end

  #Was this form submittted to reject the event?
  def ablehnen?
    params[:commit] == "Ablehnen"
  end

  #Was this form submitted to accept the event?
  def genehmigen?
    params[:commit] == "Genehmigen"
  end

  #Was this form submitted to publish the event?
  def publizieren?
    params[:commit] == "Veröffentlichen"
  end

  #Was this form submitted to unpublish an event?
  def unpublizieren?
    params[:commit] == "Unpublizieren"
  end

end
