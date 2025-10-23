# frozen_string_literal: true

# Modal component - overlay dialog with content
# Follows Wind UI structure with role="dialog" wrapper and role="document" container
# Internal padding: 1.5rem (24px) as per Wind UI specs
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
    div(
      data: {
        controller: "modal",
        modal_hidden_class: "hidden"
      },
      role: "dialog",
      aria: {
        modal: "true",
        labelledby: title.present? ? "modal-title" : nil
      },
      **@attrs
    ) do
      # Backdrop
      div(
        class: "hidden fixed inset-0 bg-black bg-opacity-50 z-40 transition-opacity",
        data: {
          modal_target: "backdrop",
          action: "click->modal#closeOnBackdrop"
        }
      )

      # Modal
      component_class = [
        "hidden fixed top-1/2 left-1/2 -translate-x-1/2 -translate-y-1/2 z-50",
        "bg-white rounded-lg shadow-xl",
        MODAL_SIZES[size.to_sym] || MODAL_SIZES[:md],
        "max-h-[90vh] overflow-y-auto",
        class_name
      ].filter_map { |c| c if c.present? }.join(" ")

      div(
        class: component_class,
        data: { modal_target: "container" },
        role: "document"
      ) do
        # Header
        if title.present?
          div(class: "flex items-center justify-between px-6 py-4 border-b border-gray-200") do
            h2(id: "modal-title", class: "text-xl font-semibold text-gray-900") { plain(title) }
            button(
              type: "button",
              class: "text-gray-400 hover:text-gray-600 text-3xl leading-none focus:outline-none focus:ring-2 focus:ring-blue-500 rounded",
              data: { action: "click->modal#close" },
              aria: { label: "Close modal" }
            ) { "×" }
          end
        end

        # Content
        div(class: "px-6 py-4") do
          @block&.call
        end
      end
    end
  end
end
