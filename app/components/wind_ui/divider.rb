# frozen_string_literal: true

# Divider component - visual separator
#
# Usage:
#   Components::WindUI::Divider.new
#   Components::WindUI::Divider.new(text: "OR", variant: :secondary)
class Components::WindUI::Divider < Components::WindUI::Base
  attr_reader :text, :variant, :class_name

  def initialize(text: nil, variant: :primary, class_name: nil, **attrs)
    @text = text
    @variant = variant
    @class_name = class_name
    @attrs = attrs
  end

  def view_template
    if text.present?
      divider_with_text
    else
      divider_without_text
    end
  end

  private

  def divider_with_text
    component_class = [
      "flex items-center my-4",
      class_name
    ].filter_map { |c| c if c.present? }.join(" ")

    div(class: component_class, **@attrs) do
      div(class: "flex-grow border-t border-gray-300")
      span(class: "px-3 text-gray-500 text-sm font-medium") { text }
      div(class: "flex-grow border-t border-gray-300")
    end
  end

  def divider_without_text
    component_class = [
      "border-t border-gray-300 my-4",
      class_name
    ].filter_map { |c| c if c.present? }.join(" ")

    hr(class: component_class, **@attrs)
  end
end
