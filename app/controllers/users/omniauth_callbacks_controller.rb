class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def google_oauth2
    @user = User.from_omniauth(request.env['omniauth.auth'])
    redirect @user
  end

  private
  def redirect(user)
    if @user.has_permitted_domain?
      if @user.save
        sign_in @user
        redirect_to root_path
      else
        flash[:error] = 'Sorry, but something went wrong, our team will look into it right away'
      end
    else
      flash[:error] = 'Sorry, but we could not log you in via Google.'
      redirect_to error_sessions_path
    end
  end
end
