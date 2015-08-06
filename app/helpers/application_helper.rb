module ApplicationHelper
  def user_state_link_to
    if user_signed_in?
      link_to "sign out",  destroy_user_session_path, method: :delete
    else
      link_to "sign in with Google", omniauth_authorize_path(:user, :google_oauth2)
    end
  end
end
