# frozen_string_literal: true

# Dropdown component - menu with options
# Follows Wind UI HTML structure with <ul> list for menu items
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

    div(
      class: component_class,
      data: {
        controller: "dropdown",
        dropdown_hidden_class: "hidden",
        action: "keydown->dropdown#handleKeydown"
      },
      **@attrs
    ) do
      # Trigger button
      button(
        type: "button",
        class: "inline-flex items-center px-4 py-2 border border-gray-300 rounded-lg text-gray-900 hover:bg-gray-50 focus:outline-none focus:ring-2 focus:ring-blue-500",
        data: {
          dropdown_target: "trigger",
          action: "click->dropdown#toggle"
        },
        aria: {
          expanded: "false",
          haspopup: "true"
        }
      ) do
        plain(trigger)
        span(class: "ml-2") { "▼" }
      end

      # Dropdown menu (Wind UI uses <ul> structure)
      ul(
        class: "hidden absolute right-0 mt-2 w-48 bg-white border border-gray-200 rounded-lg shadow-lg z-10 list-none py-2",
        data: { dropdown_target: "menu" },
        role: "menu"
      ) do
        items.each do |item|
          li do
            a(
              href: item[:href],
              class: "flex items-start justify-start gap-2 px-4 py-2 text-sm transition-colors duration-300 #{'text-red-600 hover:bg-red-50' if item[:danger]} #{'text-gray-700 hover:bg-gray-50' unless item[:danger]}",
              role: "menuitem"
            ) do
              span(class: "flex flex-col gap-1 overflow-hidden whitespace-nowrap") do
                span(class: "leading-5 truncate") { plain(item[:label]) }
              end
            end
          end
        end
      end
    end
  end
end
