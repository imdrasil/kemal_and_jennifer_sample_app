- build_form :micropost, microposts_path do |f|
  == csrf_tag
  .field
    == f.text_area_field :content, "", { "placeholder" => "Compose new micropost...", "size" => "30x10" }
  button.btn.btn-primary type="submit" Post
  span.picture
    / TODO: allow picture upload
    / == file_field name: :picture
