# frozen_string_literal: true

# Dropdown component - menu with options
#
# Usage:
#   Components::WindUI::Dropdown.new(
#     trigger: "More",
#     items: [
#       { label: "Edit", href: "/edit" },
#       { label: "Delete", href: "/delete", danger: true }
#     ]
#   )
class Components::WindUI::Dropdown < Components::WindUI::Base
  attr_reader :trigger, :items, :class_name

  def initialize(trigger: nil, items: [], class_name: nil, **attrs)
    @trigger = trigger
    @items = items
    @class_name = class_name
    @attrs = attrs
  end

  def view_template
    component_class = [
      "relative inline-block",
      class_name
    ].filter_map { |c| c if c.present? }.join(" ")

    div(class: component_class, **@attrs) do
      # Trigger button
      button(
        type: "button",
        class: "inline-flex items-center px-4 py-2 border border-gray-300 rounded-lg text-gray-900 hover:bg-gray-50"
      ) do
        plain(trigger)
        span(class: "ml-2") { "▼" }
      end

      # Dropdown menu
      div(class: "hidden absolute right-0 mt-2 w-48 bg-white border border-gray-200 rounded-lg shadow-lg z-10") do
        items.each do |item|
          a(
            href: item[:href],
            class: "block px-4 py-2 text-sm #{'text-red-600 hover:bg-red-50' if item[:danger]} #{'text-gray-900 hover:bg-gray-100' unless item[:danger]}"
          ) do
            plain(item[:label])
          end
        end
      end
    end
  end
end
