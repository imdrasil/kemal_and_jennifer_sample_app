.row
  .col-md-6.offset-md-3.col-xs-12
    - build_form :session, sign_in_path do |f|
      == csrf_tag
      .form-group
        == f.label_for :email, "Email"
        == f.text_field :email, nil

      .form-group
        == f.label_for :password, "Password"
        == link_to new_password_reset_path, "(forgot password)"
        == f.password_field :password

      button.btn.btn-primary type="submit" Log in

    p
      | New user?
      == link_to sign_up_path, "Sign up now"
