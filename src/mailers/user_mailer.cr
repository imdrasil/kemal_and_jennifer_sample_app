require "./application_mailer"

class UserMailer < ApplicationMailer
  getter user : User

  def initialize(user_id)
    @user = User.find!(user_id)

    @email_address = user.email
    @email_subject = ""
  end

  private def edit_account_activation_url(token, email)
    root_url + "/account_activation/#{token}/edit?email=#{URI.escape(email)}"
  end

  private def edit_password_reset_url(token, email)
    root_url + "/password_resets/#{token}/edit?email=#{URI.escape(email)}"
  end

  private def root_url
    "http://#{::Settings.host}:#{::Settings.port}"
  end
end
