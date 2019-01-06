require "./user_mailer"

class AccountActivationEmail < UserMailer
  @token : String

  def initialize(user_id, @token)
    super(user_id)
    @email_subject = "Account activation"
  end

  templates text
  html_template
end
