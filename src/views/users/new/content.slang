h1 Sign up

p.text-xs-center
  == link_to sign_in_path, "Have an account?"

.row
  .col-md-6.col-md-offset-3
    - build_form :user, sign_up_path do |f|
      == csrf_tag
      - render_partial :error_messages, user.errors

      .form-group
        - f.label_for :name, "Name"
        - f.text_field :name
      fieldset.form-group
        - f.label_for :email, "Email"
        - f.text_field :email
      .form-group
        - f.label_for :password, "Password"
        - f.password_field :password
      fieldset.form-group
        - f.label_for :password_confirmation, "Confirmation"
        - f.password_field :password_confirmation

      button.btn.btn-lg.btn-primary.pull-xs-right type="submit" Sign Up
