# EventAttendings Controller
class EventAttendingsController < ApplicationController
  before_action :authenticate_user!

  def create
    attended_event = Event.find(params[:attended_event_id])
    if ((attended_event.event_date - Time.now) / 3600.round).positive?
      @event_attending = EventAttending.new(event_attendee_id: current_user.id, attended_event_id: params[:attended_event_id])
    else
      flash[:alert] = 'You cannot attend a past event'
      redirect_to event_path(params[:attended_event_id])
      return
    end

    respond_to do |format|
      if @event_attending.save
        format.html { redirect_to event_path(params[:attended_event_id]), notice: 'You decided to attend this event' }
        format.json { render :show, status: :created, location: @event }
      else
        format.html { redirect_to event_path(params[:attended_event_id]), alert: 'Something is wrong. Check if your name already exists in the attendees list' }
        format.json { render json: @event_attending.errors, status: :unprocessable_entity }
      end
    end
  end
end
