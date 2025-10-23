# frozen_string_literal: true

# Tabs component - tabbed interface for content
# Follows Wind UI structure with <ul role="tablist"> and proper ARIA attributes
# Includes aria-setsize, aria-posinset, aria-controls, aria-selected, aria-hidden
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

    div(
      class: component_class,
      data: {
        controller: "tabs",
        tabs_index_value: default_tab,
        tabs_active_class: "border-blue-600 text-blue-600",
        tabs_inactive_class: "border-transparent text-gray-600 hover:text-gray-900 hover:border-gray-300"
      },
      **@attrs
    ) do
      # Tab list
      ul(class: "border-b border-gray-200 flex space-x-8", role: "tablist") do
        tabs.each_with_index do |tab, index|
          is_active = index == default_tab
          button_class = [
            "py-3 px-1 border-b-2 font-medium text-sm focus:outline-none focus:ring-2 focus:ring-blue-500 focus:ring-offset-2",
            is_active ? "border-blue-600 text-blue-600" : "border-transparent text-gray-600 hover:text-gray-900 hover:border-gray-300"
          ].join(" ")

          li(role: "presentation") do
            button(
              type: "button",
              class: button_class,
              role: "tab",
              id: "tab-#{index}",
              data: {
                tabs_target: "tab",
                index: index,
                action: "click->tabs#select keydown->tabs#handleKeydown"
              },
              aria: {
                selected: is_active,
                controls: "panel-#{index}",
                setsize: tabs.length,
                posinset: index + 1
              },
              tabindex: is_active ? "0" : "-1"
            ) do
              plain(tab[:label])
            end
          end
        end
      end

      # Tab content
      tabs.each_with_index do |tab, index|
        is_active = index == default_tab
        div(
          id: "panel-#{index}",
          class: is_active ? "block" : "hidden",
          role: "tabpanel",
          data: { tabs_target: "panel" },
          aria: {
            hidden: !is_active,
            labelledby: "tab-#{index}"
          },
          hidden: !is_active
        ) do
          div(class: "py-6") { plain(tab[:content]) }
        end
      end
    end
  end
end
