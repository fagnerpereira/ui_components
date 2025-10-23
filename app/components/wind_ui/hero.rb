# frozen_string_literal: true

# Hero component - large eye-catching section, typically at top of page
#
# Usage:
#   Components::WindUI::Hero.new(title: "Welcome", subtitle: "Get started today") { render button }
class Components::WindUI::Hero < Components::WindUI::Base
  attr_reader :title, :subtitle, :background, :class_name

  def initialize(title: nil, subtitle: nil, background: :gradient, class_name: nil, **attrs, &block)
    @title = title
    @subtitle = subtitle
    @background = background
    @class_name = class_name
    @attrs = attrs
    @block = block
  end

  def view_template
    bg_class = case background
    when :gradient then "bg-gradient-to-r from-blue-600 to-blue-800"
    when :dark then "bg-gray-900"
    when :light then "bg-gray-50"
    else "bg-white"
    end

    text_color = background == :light ? "text-gray-900" : "text-white"

    component_class = [
      "py-16 sm:py-24 lg:py-32",
      bg_class,
      class_name
    ].filter_map { |c| c if c.present? }.join(" ")

    section(class: component_class, **@attrs) do
      div(class: "max-w-4xl mx-auto px-4 sm:px-6 lg:px-8 text-center") do
        h1(class: "text-4xl sm:text-5xl lg:text-6xl font-bold #{text_color} mb-4") do
          plain(title)
        end if title.present?

        p(class: "text-lg sm:text-xl #{text_color} opacity-90 mb-8") do
          plain(subtitle)
        end if subtitle.present?

        @block&.call
      end
    end
  end
end
