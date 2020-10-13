class UsersController < ApplicationController
  def show
    @user_created_events_upcoming = current_user.created_events.upcoming_events.order('created_at DESC')
    @user_created_events_past = current_user.created_events.past_events.order('created_at DESC')
    @user_attended_events_upcoming = current_user.created_events.upcoming_events.order('created_at DESC')
    @user_attended_events_past = current_user.attended_events.past_events.order('created_at DESC')
  end
end
