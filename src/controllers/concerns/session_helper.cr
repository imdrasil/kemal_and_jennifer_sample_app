module SessionHelper
  abstract def current_user

  def current_user?(user : User)
    current_user.try(&.id.==(user.id))
  end

  def current_user!
    current_user.not_nil!
  end

  def signed_in?
    current_user ? true : false
  end
end
