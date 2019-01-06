class NewMicropostForm < FormObject::Base(Micropost)
  delegate id, to: resource

  path "micropost"

  attr :content, String
end
