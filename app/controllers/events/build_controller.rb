class Events::BuildController < ApplicationController
  steps :build_event, :add_recurrence, :add_exludes
  def show
    @event = Event.find(:event_id)
    render_wizard
  end
  def update

  end
  def create
    @event = Event.create
    redirect_to wizard_path(steps.first,:event_id => @event.id)
  end
end
