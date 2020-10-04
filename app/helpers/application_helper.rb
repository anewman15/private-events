module ApplicationHelper
  def welcome_current_user(current_user)
    "Welcome, #{current_user.first_name} #{current_user.last_name}" if user_signed_in?
  end
end
