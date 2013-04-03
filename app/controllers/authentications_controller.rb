class AuthenticationsController < ApplicationController
  def index
    @authentications = current_user.authentications if current_user
  end

  def create
    user = User.new
    data = request.env["omniauth.auth"]
    user.name = data[:info][:name]
    user.email = data[:extra][:raw_info][:email]
    password_length = 8
    password = Devise.friendly_token.first(password_length)
    user.password = password
    sign_in(user)
  end

end
