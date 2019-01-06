require "view_model"
require "kilt/slang"

class CustomFormBuilder < ViewModel::FormBuilder
  private def field_class(name, tag)
    super + " form-control"
  end
end

ViewModel.default_form_builder = CustomFormBuilder
