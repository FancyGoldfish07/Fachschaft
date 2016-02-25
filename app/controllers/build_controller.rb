class BuildController < ApplicationController
  include Wicked::Wizard
  steps :build, :add_recurrence, :add_excludes, :check

  def show
    @event = Event.find(params[:event_id])
    if @event.repeats
      if !@event.recurrence.present?
#Create a new recurrence with the date of our event.
        @event.create_recurrence(start: @event.start.to_date, end: @event.start.to_date + 1.month)
        @event.save
       @recurrence = @event.recurrence
      else
      @recurrence = @event.recurrence
      end

    else
      @event.recurrence = nil
      @event.save
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
        excludes = excludes.delete_if{ |x| x.empty? }
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
      #version.changeState(current_user)


  end
render_wizard @event
end
def edit
  @event = Event.find(params[:id])
  copy= @event.deep_clone( include: [:event_roles,{recurrence: [:rules,:excludes]}])
  copy.save!
  redirect_to wizard_path(steps.first, :event_id => copy.id)
end

def create
  @event = Event.create
  redirect_to wizard_path(steps.first, :event_id => @event.id)
end
  def new
    @event = Event.create
    redirect_to wizard_path(steps.first, :event_id => @event.id)
  end

private
#Safe params
def event_params
  params.require(:event).permit(:title, :start,:event_category_id, :priority, :flag, :imageURL, :url, :end, :ort, :description, :repeats, :reviewed, :event_role)
end

def recurrence_params
  params.require(:recurrence).permit(:event_id, :start, :end, rules_attributes: [:id, :day, :week, :month, :days, :_destroy], exclude_ids:[])
end

end
