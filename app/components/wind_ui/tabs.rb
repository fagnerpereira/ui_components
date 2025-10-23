# frozen_string_literal: true

# Tabs component - tabbed interface for content
#
# Usage:
#   Components::WindUI::Tabs.new(
#     tabs: [
#       { label: "Tab 1", content: "Content 1" },
#       { label: "Tab 2", content: "Content 2" }
#     ]
#   )
class Components::WindUI::Tabs < Components::WindUI::Base
  attr_reader :tabs, :default_tab, :class_name

  def initialize(tabs: [], default_tab: 0, class_name: nil, **attrs)
    @tabs = tabs
    @default_tab = default_tab
    @class_name = class_name
    @attrs = attrs
  end

  def view_template
    component_class = [
      "w-full",
      class_name
    ].filter_map { |c| c if c.present? }.join(" ")

    div(class: component_class, **@attrs) do
      # Tab list
      div(class: "border-b border-gray-200 flex space-x-8") do
        tabs.each_with_index do |tab, index|
          is_active = index == default_tab
          button_class = [
            "py-3 px-1 border-b-2 font-medium text-sm",
            is_active ? "border-blue-600 text-blue-600" : "border-transparent text-gray-600 hover:text-gray-900 hover:border-gray-300"
          ].join(" ")

          button(type: "button", class: button_class) do
            plain(tab[:label])
          end
        end
      end

      # Tab content
      tabs.each_with_index do |tab, index|
        is_active = index == default_tab
        div(class: is_active ? "block" : "hidden", role: "tabpanel") do
          div(class: "py-6") { plain(tab[:content]) }
        end
      end
    end
  end
end
