class Events::BuildController < ApplicationController
  include Wicked::Wizard
  steps :build, :add_recurrence, :add_exludes
  def show
    @event = Event.find(params[:event_id])
    render_wizard
  end
  def update
    @event = Event.find(params[:event_id])
    case step
      when :build
        @event.update(event_params)
    end

    render_wizard @event
  end
  def create
    @event = Event.create
    redirect_to wizard_path(steps.first,:event_id => @event.id)
  end
  private
  def event_params
    params.require(:event).permit(:title, :start, :priority, :flag, :imageURL, :url, :end, :ort, :description,role_ids: [])
  end
end
