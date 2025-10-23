# frozen_string_literal: true

# Footer component - page footer with links and information
#
# Usage:
#   Components::WindUI::Footer.new(
#     brand: "MyApp",
#     sections: [
#       {
#         title: "Product",
#         links: [["Home", "/"], ["Features", "/features"]]
#       }
#     ]
#   )
class Components::WindUI::Footer < Components::WindUI::Base
  attr_reader :brand, :sections, :class_name

  def initialize(brand: nil, sections: [], class_name: nil, **attrs)
    @brand = brand
    @sections = sections
    @class_name = class_name
    @attrs = attrs
  end

  def view_template
    component_class = [
      "bg-gray-900 text-white",
      class_name
    ].filter_map { |c| c if c.present? }.join(" ")

    footer(class: component_class, **@attrs) do
      div(class: "max-w-6xl mx-auto px-4 py-12") do
        # Main footer content
        div(class: "grid md:grid-cols-#{[ sections.length + 1, 4 ].min} gap-8 mb-8") do
          # Brand section
          if brand.present?
            div do
              h3(class: "text-lg font-bold mb-4") { plain(brand) }
              p(class: "text-gray-400 text-sm") { "© 2024 All rights reserved." }
            end
          end

          # Link sections
          sections.each do |section|
            div do
              h4(class: "font-semibold mb-4") { plain(section[:title]) }
              ul(class: "space-y-2") do
                section[:links]&.each do |text, href|
                  li do
                    a(href: href, class: "text-gray-400 hover:text-white transition-colors") do
                      plain(text)
                    end
                  end
                end
              end
            end
          end
        end

        # Bottom footer
        div(class: "border-t border-gray-800 pt-8 flex justify-between items-center") do
          p(class: "text-gray-400 text-sm") { "Privacy • Terms • Contact" }
          div(class: "flex space-x-4") do
            [ "Twitter", "GitHub", "LinkedIn" ].each do |social|
              a(href: "#", class: "text-gray-400 hover:text-white") { plain(social) }
            end
          end
        end
      end
    end
  end
end
