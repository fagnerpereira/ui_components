# frozen_string_literal: true

# Navbar component - top navigation bar
#
# Usage:
#   Components::WindUI::Navbar.new(
#     brand: "MyApp",
#     links: [["Home", "/"], ["About", "/about"], ["Contact", "/contact"]]
#   )
class Components::WindUI::Navbar < Components::WindUI::Base
  attr_reader :brand, :links, :class_name

  def initialize(brand: nil, links: [], class_name: nil, **attrs, &block)
    @brand = brand
    @links = links
    @class_name = class_name
    @attrs = attrs
    @block = block
  end

  def view_template
    component_class = [
      "bg-white border-b border-gray-200",
      class_name
    ].filter_map { |c| c if c.present? }.join(" ")

    nav(class: component_class, **@attrs) do
      div(class: "max-w-6xl mx-auto px-4 sm:px-6 lg:px-8") do
        div(class: "flex justify-between items-center h-16") do
          # Brand
          if brand.present?
            a(href: "/", class: "text-xl font-bold text-gray-900") do
              plain(brand)
            end
          end

          # Links
          div(class: "hidden md:flex items-center space-x-8") do
            links.each do |text, href|
              a(
                href: href,
                class: "text-gray-600 hover:text-gray-900 transition-colors"
              ) { plain(text) }
            end
          end

          # Custom content (slot)
          @block&.call
        end
      end
    end
  end
end
