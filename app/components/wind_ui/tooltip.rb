# frozen_string_literal: true

# Tooltip component - floating hint text
#
# Usage:
#   Components::WindUI::Tooltip.new(text: "Help text", position: :top) { "Hover me" }
class Components::WindUI::Tooltip < Components::WindUI::Base
  POSITIONS = {
    top: "bottom-full mb-2 left-1/2 -translate-x-1/2",
    bottom: "top-full mt-2 left-1/2 -translate-x-1/2",
    left: "right-full mr-2 top-1/2 -translate-y-1/2",
    right: "left-full ml-2 top-1/2 -translate-y-1/2"
  }.freeze

  attr_reader :text, :position, :class_name

  def initialize(text: nil, position: :top, class_name: nil, **attrs, &block)
    @text = text
    @position = position
    @class_name = class_name
    @attrs = attrs
    @block = block
  end

  def view_template
    component_class = [
      "relative inline-block group",
      class_name
    ].filter_map { |c| c if c.present? }.join(" ")

    div(class: component_class, **@attrs) do
      # Trigger element
      @block&.call

      # Tooltip
      div(class: "invisible group-hover:visible absolute #{POSITIONS[position.to_sym] || POSITIONS[:top]} z-10 bg-gray-900 text-white text-sm px-3 py-2 rounded whitespace-nowrap") do
        plain(text)
      end
    end
  end
end
