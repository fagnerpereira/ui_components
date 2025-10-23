# frozen_string_literal: true

# Button component
#
# Usage:
#   Components::WindUI::Button.new(text: "Click me", variant: :primary, size: :md)
#   Components::WindUI::Button.new(text: "Link Button", href: "/path", variant: :outline)
class Components::WindUI::Button < Components::WindUI::Base
  attr_reader :text, :variant, :size, :href, :disabled, :type, :class_name

  def initialize(
    text: nil,
    variant: :primary,
    size: :md,
    href: nil,
    disabled: false,
    type: "button",
    class_name: nil,
    **attrs
  )
    @text = text
    @variant = variant
    @size = size
    @href = href
    @disabled = disabled
    @type = type
    @class_name = class_name
    @attrs = attrs
  end

  def view_template
    tag = href.present? ? :a : :button

    component_class = [
      "inline-flex items-center justify-center font-semibold rounded-lg",
      "transition-colors duration-200",
      "focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-blue-500",
      "disabled:opacity-50 disabled:cursor-not-allowed",
      variant_class(variant),
      size_class(size),
      class_name
    ].filter_map { |c| c if c.present? }.join(" ")

    if href.present?
      a(href: href, class: component_class, **@attrs) { text }
    else
      button(
        type: type,
        class: component_class,
        disabled: disabled,
        **@attrs
      ) { text }
    end
  end
end
