class EventAttendingsController < ApplicationController
  before_action :authenticate_user!

  def create
    # byebug
    @event_attending = EventAttending.new(event_attendee_id: current_user.id, attended_event_id: params[:attended_event_id])

    respond_to do |format|
      if @event_attending.save
        format.html { redirect_to event_path(params[:attended_event_id]), notice: 'You decided to attend this event.' }
        format.json { render :show, status: :created, location: @event }
      else
        format.html { redirect_to new_user_session_path, @event_attending.errors, notice: 'You need to login' }
        format.json { render json: @event_attending.errors, status: :unprocessable_entity }
      end
    end
  end
end
