module EventAttendingsHelper
  def attend_event_button(f)
    if user_signed_in?
      f.submit "Attend this event", class: "button is-success mr-5"
    else
      link_to "Login to Attend this event", new_user_session_path, class: "button is-success mr-5"
    end
  end

  def my_events_button(user_path)
    if user_signed_in?
      link_to 'Go to My Events', user_path, class: "button is-white"
    end
  end
end
