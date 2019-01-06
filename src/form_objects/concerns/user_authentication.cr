require "../../services/generate_secure_token"

module UserAuthentication
  include Jennifer::Model::Authentication
  include FormObject::Module

  attr :password, String, virtual: true
  attr :password_confirmation, String, virtual: true

  macro included
    with_authentication
  end

  property password_digest : String = ""
end
