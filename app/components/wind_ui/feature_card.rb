# frozen_string_literal: true

# Feature Card component - showcases a feature with icon and description
#
# Usage:
#   Components::WindUI::FeatureCard.new(
#     title: "Fast",
#     description: "Lightning quick performance",
#     icon: "⚡"
#   )
class Components::WindUI::FeatureCard < Components::WindUI::Base
  attr_reader :title, :description, :icon, :class_name

  def initialize(title: nil, description: nil, icon: nil, class_name: nil, **attrs)
    @title = title
    @description = description
    @icon = icon
    @class_name = class_name
    @attrs = attrs
  end

  def view_template
    component_class = [
      "p-6 bg-white border border-gray-200 rounded-lg hover:shadow-lg transition-shadow",
      class_name
    ].filter_map { |c| c if c.present? }.join(" ")

    div(class: component_class, **@attrs) do
      if icon.present?
        div(class: "text-4xl mb-4") { plain(icon) }
      end

      h3(class: "text-lg font-semibold text-gray-900 mb-2") { plain(title) } if title.present?
      p(class: "text-gray-600 text-sm") { plain(description) } if description.present?
    end
  end
end
