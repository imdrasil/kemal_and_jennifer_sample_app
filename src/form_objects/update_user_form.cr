require "./concerns/user_fields"

class UpdateUserForm < FormObject::Base(User)
  include UserFields
  include Jennifer::Model::Authentication

  path "user"
end
