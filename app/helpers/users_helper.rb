module UsersHelper
  def welcome_current_user(current_user)
    "Welcome, #{current_user.first_name} #{current_user.last_name}" if user_signed_in?
  end

  def minimum_chars_hint(minimum_password_length)
    "#{minimum_password_length} characters minimum" if minimum_password_length
  end

  def wait_email_confirmation
    return unless devise_mapping.confirmable? && resource.pending_reconfirmation?

    content_tag(:p, "Currently waiting confirmation for: #{resource.unconfirmed_email}")
  end
end
