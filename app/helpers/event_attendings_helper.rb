module EventAttendingsHelper
  def attend_event_button(form)
    if user_signed_in?
      form.submit 'Attend this event', class: 'button is-success mr-5'
    else
      link_to 'Login to Attend this event', new_user_session_path, class: 'button is-success mr-5'
    end
  end

  def my_events_button(user_path)
    link_to 'Go to My Events', user_path, class: 'button is-white' if user_signed_in?
  end
end
