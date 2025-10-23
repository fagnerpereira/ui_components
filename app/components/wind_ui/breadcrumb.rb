# frozen_string_literal: true

# Breadcrumb component - navigation trail
#
# Usage:
#   Components::WindUI::Breadcrumb.new(
#     items: [["Home", "/"], ["Products", "/products"], ["Electronics", nil]]
#   )
class Components::WindUI::Breadcrumb < Components::WindUI::Base
  attr_reader :items, :class_name

  def initialize(items: [], class_name: nil, **attrs)
    @items = items
    @class_name = class_name
    @attrs = attrs
  end

  def view_template
    component_class = [
      "text-sm text-gray-600",
      class_name
    ].filter_map { |c| c if c.present? }.join(" ")

    nav(class: component_class, "aria-label": "Breadcrumb", **@attrs) do
      ol(class: "flex items-center space-x-2") do
        items.each_with_index do |(text, href), index|
          li(class: "flex items-center") do
            if index > 0
              span(class: "mx-2 text-gray-400") { "/" }
            end

            if href.present?
              a(href: href, class: "text-blue-600 hover:text-blue-700") do
                plain(text)
              end
            else
              span(class: "text-gray-900 font-medium") { plain(text) }
            end
          end
        end
      end
    end
  end
end
