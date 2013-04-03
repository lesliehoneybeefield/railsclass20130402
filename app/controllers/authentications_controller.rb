class AuthenticationsController < ApplicationController
  def index
    @authentications = current_user.authentications if current_user
  end

  def create
    data = request.env["omniauth.auth"]
    email = data[:info][:email]
    user = User.find_by_email(email)
    if user.blank?
      user = User.new
      user.email = email
      user.name = data[:info][:name]
      user.image_url = data[:info][:image]
      password_length = 8
      password = Devise.friendly_token.first(password_length)
      user.password = password
      sign_in(user)
    else
      sign_in(user)
    end
    redirect_to :root
  end

end
