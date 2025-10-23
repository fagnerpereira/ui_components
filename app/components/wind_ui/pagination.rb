# frozen_string_literal: true

# Pagination component - navigation for paginated content
#
# Usage:
#   Components::WindUI::Pagination.new(current_page: 2, total_pages: 5)
class Components::WindUI::Pagination < Components::WindUI::Base
  attr_reader :current_page, :total_pages, :class_name

  def initialize(current_page: 1, total_pages: 1, class_name: nil, **attrs)
    @current_page = current_page
    @total_pages = total_pages
    @class_name = class_name
    @attrs = attrs
  end

  def view_template
    component_class = [
      "flex items-center justify-center space-x-2",
      class_name
    ].filter_map { |c| c if c.present? }.join(" ")

    nav(class: component_class, "aria-label": "Pagination", **@attrs) do
      # Previous button
      a(
        href: "#",
        class: current_page > 1 ? "px-3 py-2 text-gray-600 hover:bg-gray-100 rounded" : "px-3 py-2 text-gray-400 cursor-not-allowed"
      ) { "← Previous" }

      # Page numbers
      (1..total_pages).each do |page|
        button_class = if page == current_page
                         "px-3 py-2 bg-blue-600 text-white rounded font-medium"
        else
                         "px-3 py-2 text-gray-600 hover:bg-gray-100 rounded"
        end
        button(type: "button", class: button_class) { page.to_s }
      end

      # Next button
      a(
        href: "#",
        class: current_page < total_pages ? "px-3 py-2 text-gray-600 hover:bg-gray-100 rounded" : "px-3 py-2 text-gray-400 cursor-not-allowed"
      ) { "Next →" }
    end
  end
end
