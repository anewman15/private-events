class UsersController < ApplicationController
  def show
    @user_events = current_user.created_events
    @user_attended_events = current_user.attended_events
  end
end