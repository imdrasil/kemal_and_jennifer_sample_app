module RouterHelper
  def root_path
    "/"
  end

  def about_path
    "/about"
  end

  # users

  def users_path
    "/users"
  end

  def user_path(id)
    "/users/#{id}"
  end

  def user_edit_path(id)
    user_path(id) + "/edit"
  end

  def following_user_path(id)
    user_path(id) + "/following"
  end

  def followers_user_path(id)
    user_path(id) + "/followers"
  end

  def destroy_user_path(id)
    user_path(id) + "?_csrf=#{csrf_token}"
  end

  # micropost

  def microposts_path
    "/microposts"
  end

  def destroy_micropost_path(id)
    "/microposts/#{id}?_csrf=#{csrf_token}"
  end

  # relationships

  def relationship_path(id)
    "/relationships/#{id}"
  end

  def relationships_path
    "/relationships"
  end

  # session

  def logout_path
    "/sign_out"
  end

  def sign_in_path
    "/sign_in"
  end

  def sign_up_path
    "/sign_up"
  end

  # password reset

  def new_password_reset_path
    password_reset_path + "/new"
  end

  def password_reset_path
    "/password_resets"
  end

  def password_reset_path(email)
    "/password_resets/#{email}"
  end

  # assets

  def image_path(image)
    "/images/#{image}"
  end
end
