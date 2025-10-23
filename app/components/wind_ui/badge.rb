# frozen_string_literal: true

# Badge component - a small tag for labeling and categorization
#
# Usage:
#   Components::WindUI::Badge.new(text: "New", variant: :primary)
#   Components::WindUI::Badge.new(text: "Beta", variant: :warning, size: :lg)
class Components::WindUI::Badge < Components::WindUI::Base
  BADGE_VARIANTS = {
    primary: "bg-blue-100 text-blue-800",
    secondary: "bg-gray-100 text-gray-800",
    danger: "bg-red-100 text-red-800",
    success: "bg-green-100 text-green-800",
    warning: "bg-amber-100 text-amber-800",
    info: "bg-cyan-100 text-cyan-800"
  }.freeze

  BADGE_SIZES = {
    sm: "px-2 py-0.5 text-xs",
    md: "px-2.5 py-1 text-sm",
    lg: "px-3 py-1.5 text-base"
  }.freeze

  attr_reader :text, :variant, :size, :class_name

  def initialize(text: nil, variant: :primary, size: :md, class_name: nil, **attrs)
    @text = text
    @variant = variant
    @size = size
    @class_name = class_name
    @attrs = attrs
  end

  def view_template
    component_class = [
      "inline-flex items-center font-medium rounded-full",
      BADGE_VARIANTS[variant.to_sym] || BADGE_VARIANTS[:primary],
      BADGE_SIZES[size.to_sym] || BADGE_SIZES[:md],
      class_name
    ].filter_map { |c| c if c.present? }.join(" ")

    span(class: component_class, **@attrs) { text }
  end
end
