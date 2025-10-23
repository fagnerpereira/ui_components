# frozen_string_literal: true

# Accordion component - collapsible content sections
#
# Usage:
#   Components::WindUI::Accordion.new(
#     items: [
#       { title: "Section 1", content: "Content 1" },
#       { title: "Section 2", content: "Content 2" }
#     ]
#   )
class Components::WindUI::Accordion < Components::WindUI::Base
  attr_reader :items, :class_name

  def initialize(items: [], class_name: nil, **attrs)
    @items = items
    @class_name = class_name
    @attrs = attrs
  end

  def view_template
    component_class = [
      "space-y-2 border border-gray-200 rounded-lg",
      class_name
    ].filter_map { |c| c if c.present? }.join(" ")

    div(class: component_class, **@attrs) do
      items.each_with_index do |item, idx|
        div(class: "border-b border-gray-200 last:border-b-0") do
          # Header
          button(
            type: "button",
            class: "w-full px-6 py-4 text-left font-medium text-gray-900 hover:bg-gray-50 flex items-center justify-between",
            "aria-expanded": false
          ) do
            plain(item[:title])
            span(class: "text-gray-400") { "▼" }
          end

          # Content (hidden by default)
          div(class: "hidden px-6 pb-4 text-gray-700") do
            plain(item[:content])
          end
        end
      end
    end
  end
end
