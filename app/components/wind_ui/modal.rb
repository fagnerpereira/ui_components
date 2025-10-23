# frozen_string_literal: true

# Modal component - overlay dialog with content
#
# Usage:
#   Components::WindUI::Modal.new(title: "Confirm", size: :md) { "Are you sure?" }
class Components::WindUI::Modal < Components::WindUI::Base
  MODAL_SIZES = {
    sm: "max-w-sm",
    md: "max-w-md",
    lg: "max-w-lg",
    xl: "max-w-2xl"
  }.freeze

  attr_reader :title, :size, :class_name

  def initialize(title: nil, size: :md, class_name: nil, **attrs, &block)
    @title = title
    @size = size
    @class_name = class_name
    @attrs = attrs
    @block = block
  end

  def view_template
    # Backdrop
    div(class: "fixed inset-0 bg-black bg-opacity-50 z-40", **@attrs)

    # Modal
    component_class = [
      "fixed top-1/2 left-1/2 -translate-x-1/2 -translate-y-1/2 z-50",
      "bg-white rounded-lg shadow-xl",
      MODAL_SIZES[size.to_sym] || MODAL_SIZES[:md],
      "max-h-[90vh] overflow-y-auto",
      class_name
    ].filter_map { |c| c if c.present? }.join(" ")

    div(class: component_class) do
      # Header
      if title.present?
        div(class: "flex items-center justify-between px-6 py-4 border-b border-gray-200") do
          h2(class: "text-xl font-semibold text-gray-900") { plain(title) }
          button(type: "button", class: "text-gray-400 hover:text-gray-600") { "×" }
        end
      end

      # Content
      div(class: "px-6 py-4") do
        @block&.call
      end
    end
  end
end
