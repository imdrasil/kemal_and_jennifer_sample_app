require "./concerns/user_fields"
require "./concerns/user_authentication"

class NewUserForm < FormObject::Base(User)
  include UserFields
  include UserAuthentication

  path "user"

  property activation_token : String?

  # TODO: think about this to make it work
  # validates_with_method :ensure_email_uniqueness

  def persist
    resource.password_digest = password_digest
    create_activation_digest
    resource.save.tap do |result|
      next unless result
      send_activation_email
    end
  end

  # This method should be muted as attr :password has already added relevant validation
  private def validate_password_presence
  end

  private def send_activation_email
    AccountActivationEmail.new(resource.id, activation_token.not_nil!).deliver
  end

  private def create_activation_digest
    token = GenerateSecureToken.call
    self.activation_token = token[:plain]
    resource.activation_digest = token[:digest]
  end
end
