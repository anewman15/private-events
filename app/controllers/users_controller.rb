class UsersController < ApplicationController
  def show
    @user_events = current_user.created_events
  end
end