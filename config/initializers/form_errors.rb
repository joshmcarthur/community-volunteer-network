ActionView::Base.field_error_proc = proc do |html_tag|
  next html_tag if html_tag.match?(/<label/) # Don't style labels

  class_attr_index = html_tag.index 'class="'

  if class_attr_index
    html_tag.insert class_attr_index + 7, "is-invalid "
  else
    html_tag.insert html_tag.index(">"), ' class="is-invalid"'.html_safe
  end
end

class ActionView::Helpers::FormBuilder
  def error(attribute)
    return unless object.errors[attribute].any?

    @template.content_tag(:p, object.errors[attribute].join(", "), class: "invalid-feedback is-visible")
  end
end
