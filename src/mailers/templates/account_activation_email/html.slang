doctype html
head
  meta http-equiv="Content-Type" content="text/html; charset=utf-8"
body
  h1 Sample App
  p Hi #{user.name}
  p
    | Welcome to the Sample App! Click on the link below to activate your account:
  a href="#{edit_account_activation_url(@token, user.email)}"
    | Activate
