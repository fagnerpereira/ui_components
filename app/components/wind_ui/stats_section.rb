# frozen_string_literal: true

# Stats Section component - displays key statistics
#
# Usage:
#   Components::WindUI::StatsSection.new(
#     stats: [
#       { label: "Users", value: "10K+" },
#       { label: "Downloads", value: "100K+" }
#     ]
#   )
class Components::WindUI::StatsSection < Components::WindUI::Base
  attr_reader :title, :stats, :class_name

  def initialize(title: nil, stats: [], class_name: nil, **attrs)
    @title = title
    @stats = stats
    @class_name = class_name
    @attrs = attrs
  end

  def view_template
    component_class = [
      "py-12 bg-white",
      class_name
    ].filter_map { |c| c if c.present? }.join(" ")

    section(class: component_class, **@attrs) do
      div(class: "max-w-4xl mx-auto px-4") do
        h2(class: "text-3xl font-bold text-center text-gray-900 mb-12") { plain(title) } if title.present?

        div(class: "grid grid-cols-2 md:grid-cols-#{stats.length} gap-8") do
          stats.each do |stat|
            div(class: "text-center") do
              div(class: "text-4xl font-bold text-blue-600") { plain(stat[:value]) }
              p(class: "text-gray-600 mt-2") { plain(stat[:label]) }
            end
          end
        end
      end
    end
  end
end
