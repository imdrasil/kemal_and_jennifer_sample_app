require "./base_service"

class ActivateUser < BaseService
  getter user : User, token : String

  delegate :activation_digest, to: user

  def initialize(@user, @token)
  end

  def call
    return false if user.activated? || !user.activation_valid?(token)
    user.activated = true
    user.activated_at = Time.new
    user.save
    true
  end
end
