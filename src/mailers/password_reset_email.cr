require "./user_mailer"

class PasswordResetEmail < UserMailer
  @token : String

  def initialize(user_id, @token)
    super(user_id)
    @email_subject = "Password reset"
  end

  templates text
  html_template
end
