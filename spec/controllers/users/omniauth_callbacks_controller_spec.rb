require 'rails_helper'

describe Users::OmniauthCallbacksController do
  let(:auth) { AUTH }

  before :each do
    request.env["devise.mapping"] = Devise.mappings[:user]
    request.env["omniauth.auth"] = auth
  end

  describe "Google Oauth2 callback method" do
    context "with bad user data" do
      before :each do
        auth.info.email = ""
      end

      it "does not create a user with bad data" do
        expect {
          get :google_oauth2
        }.to change(User, :count).by(0)
      end

      it "redirects to the auth error path" do
        get :google_oauth2
        expect(response).to redirect_to error_sessions_path
      end
    end

    it "authenticates user with permitted domain and redirects to root path" do
      get :google_oauth2
      expect(response).to redirect_to(root_path)  # or to whatever path you defined in the google_oauth2 method in your callback_controller.rb
    end

    it "does not authenticate non-HitFox emails" do
      auth.info.email = "nothitfox@nothitfox.com"
      get :google_oauth2
      expect(response).to redirect_to(error_sessions_path)
    end
  end
end
