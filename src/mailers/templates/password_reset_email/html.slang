doctype html
head
  meta http-equiv="Content-Type" content="text/html; charset=utf-8"
body
  h1 Password reset
  p To reset your password click the link below:

  a href="#{edit_password_reset_url(@token, user.email)}"
    | Reset password

  p If you did not request your password to be reset, please ignore this and your password will stay as it is.
