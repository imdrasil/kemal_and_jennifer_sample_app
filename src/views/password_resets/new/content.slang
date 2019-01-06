h1 Forgot password

.row
  .col-md-6.col-md-offset-3
    - build_form :reset_password, password_reset_path do |f|
      == csrf_tag
      .form-group
        == f.label_for :email, "Email"
        == f.text_field :email

      button.btn.btn-primary Submit
