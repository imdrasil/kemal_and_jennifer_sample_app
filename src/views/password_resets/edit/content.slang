h1 Password reset
.row
  .clo-md-6.col-md-offset-3
    - build_form :password_reset, password_reset_path(id), method: :patch do |f|
      == csrf_tag
      - render_partial :error_messages, form.errors

      == f.hidden_field :email, form.email

      .form-group
        == f.label_for :password, "Password"
        == f.password_field :password

      .form-group
        == f.label_for :password_confirmation, "Password confirmation"
        == f.password_field :password_confirmation

      button.btn.btn-primary Update password
