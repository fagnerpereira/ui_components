# frozen_string_literal: true

# Container component - wraps content with max-width and centering
#
# Usage:
#   Components::WindUI::Container.new { "Your content" }
#   Components::WindUI::Container.new(size: :lg) { "Large container" }
class Components::WindUI::Container < Components::WindUI::Base
  SIZES = {
    sm: "max-w-sm",
    md: "max-w-2xl",
    lg: "max-w-4xl",
    xl: "max-w-6xl",
    full: "max-w-full"
  }.freeze

  attr_reader :size, :padding, :class_name

  def initialize(size: :lg, padding: true, class_name: nil, **attrs, &block)
    @size = size
    @padding = padding
    @class_name = class_name
    @attrs = attrs
    @block = block
  end

  def view_template
    padding_class = padding ? "px-4 sm:px-6 lg:px-8" : ""
    component_class = [
      "mx-auto",
      SIZES[size.to_sym] || SIZES[:lg],
      padding_class,
      class_name
    ].filter_map { |c| c if c.present? }.join(" ")

    div(class: component_class, **@attrs) do
      @block&.call
    end
  end
end
