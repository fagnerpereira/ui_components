# frozen_string_literal: true

# Accordion component - collapsible content sections
# Uses native <details> and <summary> elements with Stimulus enhancements for animations
#
# Usage:
#   Components::WindUI::Accordion.new(
#     items: [
#       { title: "Section 1", content: "Content 1" },
#       { title: "Section 2", content: "Content 2" }
#     ]
#   )
class Components::WindUI::Accordion < Components::WindUI::Base
  attr_reader :items, :class_name, :allow_multiple

  def initialize(items: [], allow_multiple: false, class_name: nil, **attrs)
    @items = items
    @allow_multiple = allow_multiple
    @class_name = class_name
    @attrs = attrs
  end

  def view_template
    component_class = [
      "space-y-2 border border-gray-200 rounded-lg",
      class_name
    ].filter_map { |c| c if c.present? }.join(" ")

    div(
      class: component_class,
      data: {
        controller: "accordion",
        accordion_allow_multiple_value: "false"
      },
      **@attrs
    ) do
      items.each_with_index do |item, idx|
        div(class: "border-b border-gray-200 last:border-b-0", data: { accordion_target: "item" }) do
          # Header
          button(
            type: "button",
            class: "w-full px-6 py-4 text-left font-medium text-gray-900 hover:bg-gray-50 flex items-center justify-between focus:outline-none focus:ring-2 focus:ring-blue-500",
            data: {
              accordion_target: "trigger",
              action: "click->accordion#toggle"
            },
            aria: {
              expanded: "false",
              controls: "accordion-content-#{idx}"
            }
          ) do
            plain(item[:title])
            span(
              class: "text-gray-400 transition-transform duration-300",
              data: { accordion_target: "icon" },
              style: "transform: rotate(0deg);"
            ) { "▼" }
          end

          # Content (hidden by default)
          div(
            id: "accordion-content-#{idx}",
            class: "hidden px-6 pb-4 text-gray-700 overflow-hidden transition-all duration-300",
            data: { accordion_target: "content" },
            style: "max-height: 0;"
          ) do
            plain(item[:content])
          end
        end
      end
    end
  end
end
