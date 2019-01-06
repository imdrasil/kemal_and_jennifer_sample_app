require "./base_service"
require "../services/generate_secure_token"

class InitUserPasswordReset < BaseService
  @user : User

  def initialize(@user)
  end

  def call
    token = GenerateSecureToken.call

    @user.reset_digest = token[:digest]
    @user.reset_sent_at = Time.new
    @user.save!
    PasswordResetEmail.new(@user.id, token[:plain]).deliver
  end
end
