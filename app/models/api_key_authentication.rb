class ApiKeyAuthentication
  def self.before(controller)
    new.authenticate controller
  end

  def authenticate(controller)
    api_account = ApiKey.find_by_account(controller.params[:account])
    controller.render nothing: true, status: :unauthorized unless authenticated?(api_account,controller.params[:key])
  end

  private
  def authenticated?(api_account, api_key)
    api_key.to_s == api_account.try(:key)
  end
end
