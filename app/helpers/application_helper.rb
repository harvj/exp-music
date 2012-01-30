module ApplicationHelper
  def account_nav
    if user_signed_in?
      "Signed in as #{current_user.username} | " + link_to('Logout', destroy_user_session_path, :method => :delete)
    elsif controller_name == 'sessions'
      "No account? Sorry." #+ link_to('Register', new_user_registration_path)
    else
      link_to "Login", new_user_session_path
    end
  end

  def tab_to(name, options = {})
    link_to_unless_current(name, options) do
      content_tag(:span, name, :class => "current-tab")
    end
  end

end
