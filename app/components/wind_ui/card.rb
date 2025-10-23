# frozen_string_literal: true

# Card component - container with styling and optional header/footer
#
# Usage:
#   Components::WindUI::Card.new { "Card content" }
#   Components::WindUI::Card.new(title: "My Card", subtitle: "Subtitle") { "Content here" }
class Components::WindUI::Card < Components::WindUI::Base
  attr_reader :title, :subtitle, :padding, :class_name

  def initialize(title: nil, subtitle: nil, padding: :md, class_name: nil, **attrs, &block)
    @title = title
    @subtitle = subtitle
    @padding = padding
    @class_name = class_name
    @attrs = attrs
    @block = block
  end

  def view_template
    padding_class = case padding
    when :sm then "p-4"
    when :md then "p-6"
    when :lg then "p-8"
    else "p-6"
    end

    component_class = [
      "bg-white rounded-lg border border-gray-200 shadow-sm",
      padding_class,
      class_name
    ].filter_map { |c| c if c.present? }.join(" ")

    div(class: component_class, **@attrs) do
      if title.present?
        div(class: "mb-4") do
          h3(class: "text-lg font-semibold text-gray-900") { plain(title) }
          p(class: "text-sm text-gray-600 mt-1") { plain(subtitle) } if subtitle.present?
        end
        div(class: "border-b border-gray-200 mb-4")
      end

      @block&.call
    end
  end
end
