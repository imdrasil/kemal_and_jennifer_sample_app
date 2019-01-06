.row
  .col-md-6.col-md-offset-3
    .gravatar_edit
      img src=user.avatar_path
    - build_form :user, user_path(user.id), method: :patch do |f|
      == csrf_tag
      - render_partial :error_messages, form.errors
      .form-group
        - f.label_for :name, "Name"
        - f.text_field :name, form.name
      .form-group
        - f.label_for :email, "Email"
        - f.text_field :email, form.email
      / .form-group
      /   label Password
      /   input.form-control type="password"
      / .form-group
      /   label Confirmation
      /   input.form-control type="password"

      button.btn.btn-primary type="submit" Save changes
