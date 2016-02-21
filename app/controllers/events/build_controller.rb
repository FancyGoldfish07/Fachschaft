class Events::BuildController < ApplicationController
  include Wicked::Wizard
  steps :build, :add_recurrence, :add_excludes

  def show
    @event = Event.find(params[:event_id])
    if @event.repeats
      if !@event.recurrence.present?

        @event.create_recurrence
       @recurrence = @event.recurrence
      else
      @recurrence = @event.recurrence
      end

    end


  render_wizard
end

def update
  @event = Event.find(params[:event_id])
  @recurrence = @event.recurrence
  case step
    when :build
      @event.update(event_params)
    when :add_recurrence
      if @recurrence.present?
        @recurrence.update(recurrence_params)
      end
  end

  render_wizard @event
end

def create
  @event = Event.create
  redirect_to wizard_path(steps.first, :event_id => @event.id)
end

private
#Safe params
def event_params
  params.require(:event).permit(:title, :start, :priority, :flag, :imageURL, :url, :end, :ort, :description, :repeats, role_ids: [])
end

def recurrence_params
  params.require(:recurrence).permit(:event_id, :start, :end, rules_attributes: [:id, :day, :week, :month, :days, :_destroy])
end

end
