- build_form :follow, relationships_path do |f|
  == csrf_tag
  div
    - f.hidden_field :followed_id, user.id
    button.btn.btn-primary type="submit" Follow
