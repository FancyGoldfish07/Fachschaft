class BuildController < ApplicationController
  #To create a new event you need to be logged in 
  before_action :authenticate_user!
  layout "wizardForm"
  include Wicked::Wizard
  steps :build, :add_recurrence, :add_excludes, :check

  def show
    @event = Event.find(params[:event_id])
    if @event.repeats
      if !@event.recurrence.present?
#Create a new recurrence with the date of our event.
   recurrence =    Recurrence.new(start: @event.start.to_date, end: @event.start.to_date + 1.month, owner: @event)
       recurrence!(:validate=> false)
   @event.recurrence = recurrence
        @event.save!(:validate=> false)
        @recurrence = @event.recurrence
      else
        @recurrence = @event.recurrence
      end

    else
      oldRecurrence = @event.recurrence
      @event.recurrence = nil


      @event.save!(:validate=> false)
    end


    render_wizard
  end

  def update
    @event = Event.find(params[:event_id])
    @recurrence = @event.recurrence
    case step
      when :build

        @event.update(event_params)

        if !@event.repeats
          if @event.recurring
            #Add a new exclude to the recurrence of the owner of our recurrence
            Exclude.create(date: @event.start, recurrence: @event.recurrence.owner.recurrence)
            oldRecurrence = @event.recurrence
            #Remove the event from the recurrence
            @event.recurrence = nil


            @event.save
          end
          jump_to :check
        end

      when :add_recurrence
        if @recurrence.present?

          @recurrence.update(recurrence_params)

        end
      when :add_excludes
        if @recurrence.present?
          param = params[:recurrence]
          excludes = param[:exclude_ids]
          #Remove all exclude dates, because we will override them now
          #THIS HAS HORRIBLE CODE SMELL, but not sure how to do this better
          if @recurrence.excludes.count > 0
            @recurrence.excludes.each do |exclude|
              exclude.destroy
            end
          end
          #We will always have one element, which is empty, WHY, BECAUSE!
          #Well, the real reason is here: http://stackoverflow.com/questions/8929230/why-is-the-first-element-always-blank-in-my-rails-multi-select-using-an-embedde
          #Remove that element
          excludes = excludes.delete_if { |x| x.empty? }
          #We will always have one element
          if excludes.count > 0
            excludes.each do |date|
              #Add and build our date
              @recurrence.excludes.create(date: date)

            end
            #We do not need to do this. Because foreign key.
            #  @recurrence.save
          end

        end
      when :check
        #version= @event.versions.last
        @event.changeState(current_user)


    end
    render_wizard @event
  end

  def new
    @event = Event.new
    @event.save!(:validate=> false)
    redirect_to wizard_path(steps.first, :event_id => @event.id)
  end

  private
  #A finish message for our wizard
  def finish_wizard_path
    flash[:notice]= "Dein Event wurde an die Manager zur Genehmigung versendet."
  return  root_path
  end
  #Safe params
  def event_params
    params.require(:event).permit(:title, :start, :event_category_id, :priority, :flag, :imageURL, :url, :end, :ort, :description, :repeats, :reviewed, role_ids:[])
  end

  def recurrence_params
    params.require(:recurrence).permit(:event_id, :start, :end, rules_attributes: [:id, :day, :week, :month, :days, :_destroy], exclude_ids: [])
  end

end
