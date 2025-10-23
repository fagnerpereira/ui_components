# frozen_string_literal: true

# Call-to-Action Section component
#
# Usage:
#   Components::WindUI::CtaSection.new(
#     title: "Ready to get started?",
#     description: "Join thousands of users",
#     button_text: "Get Started",
#     button_href: "/signup"
#   )
class Components::WindUI::CtaSection < Components::WindUI::Base
  attr_reader :title, :description, :button_text, :button_href, :class_name

  def initialize(
    title: nil,
    description: nil,
    button_text: nil,
    button_href: nil,
    class_name: nil,
    **attrs
  )
    @title = title
    @description = description
    @button_text = button_text
    @button_href = button_href
    @class_name = class_name
    @attrs = attrs
  end

  def view_template
    component_class = [
      "py-12 bg-gradient-to-r from-blue-600 to-blue-800 text-white",
      class_name
    ].filter_map { |c| c if c.present? }.join(" ")

    section(class: component_class, **@attrs) do
      div(class: "max-w-2xl mx-auto px-4 text-center") do
        h2(class: "text-3xl sm:text-4xl font-bold mb-4") { plain(title) } if title.present?
        p(class: "text-lg opacity-90 mb-8") { plain(description) } if description.present?

        if button_text.present? && button_href.present?
          a(
            href: button_href,
            class: "inline-block px-8 py-3 bg-white text-blue-600 font-semibold rounded-lg hover:bg-gray-100 transition-colors"
          ) { plain(button_text) }
        end
      end
    end
  end
end
