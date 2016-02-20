class Events::BuildController < ApplicationController
  include Wicked::Wizard
  steps :build, :add_recurrence, :add_exludes
  def show
    @event = Event.find(params[:event_id])
    render_step(:build_event)
  end
  def update

  end
  def create
    @event = Event.create
    redirect_to wizard_path(steps.first,:event_id => @event.id)
  end
end
