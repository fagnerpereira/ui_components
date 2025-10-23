# frozen_string_literal: true

# Spinner component - loading indicator
#
# Usage:
#   Components::WindUI::Spinner.new(size: :md)
#   Components::WindUI::Spinner.new(size: :lg, variant: :primary)
class Components::WindUI::Spinner < Components::WindUI::Base
  SPINNER_SIZES = {
    sm: "w-4 h-4",
    md: "w-6 h-6",
    lg: "w-8 h-8",
    xl: "w-12 h-12"
  }.freeze

  SPINNER_COLORS = {
    primary: "text-blue-600",
    secondary: "text-gray-600",
    danger: "text-red-600",
    success: "text-green-600",
    warning: "text-amber-600",
    info: "text-cyan-600"
  }.freeze

  attr_reader :size, :variant, :class_name

  def initialize(size: :md, variant: :primary, class_name: nil, **attrs)
    @size = size
    @variant = variant
    @class_name = class_name
    @attrs = attrs
  end

  def view_template
    component_class = [
      "animate-spin inline-block",
      SPINNER_SIZES[@size.to_sym] || SPINNER_SIZES[:md],
      SPINNER_COLORS[@variant.to_sym] || SPINNER_COLORS[:primary],
      @class_name
    ].filter_map { |c| c if c.present? }.join(" ")

    # CSS-based spinner instead of SVG for better compatibility
    div(
      class: "#{component_class} rounded-full border-4 border-current border-t-transparent",
      **@attrs
    )
  end
end
