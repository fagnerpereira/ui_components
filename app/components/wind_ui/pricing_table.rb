# frozen_string_literal: true

# Pricing Table component - display pricing plans
#
# Usage:
#   Components::WindUI::PricingTable.new(
#     plans: [
#       {
#         name: "Basic",
#         price: "$29",
#         description: "For individuals",
#         features: ["Feature 1", "Feature 2"],
#         button_text: "Get Started"
#       }
#     ]
#   )
class Components::WindUI::PricingTable < Components::WindUI::Base
  attr_reader :plans, :class_name

  def initialize(plans: [], class_name: nil, **attrs)
    @plans = plans
    @class_name = class_name
    @attrs = attrs
  end

  def view_template
    component_class = [
      "py-12 bg-white",
      class_name
    ].filter_map { |c| c if c.present? }.join(" ")

    section(class: component_class, **@attrs) do
      div(class: "max-w-6xl mx-auto px-4") do
        div(class: "grid md:grid-cols-#{[ plans.length, 3 ].min} gap-8") do
          plans.each do |plan|
            div(class: "p-8 border border-gray-200 rounded-lg hover:shadow-lg transition-shadow #{plan[:featured] ? 'ring-2 ring-blue-600' : ''}") do
              h3(class: "text-2xl font-bold text-gray-900 mb-2") { plain(plan[:name]) }
              p(class: "text-gray-600 mb-4") { plain(plan[:description]) } if plan[:description]
              div(class: "text-4xl font-bold text-blue-600 mb-6") { plain(plan[:price]) }

              if plan[:features]
                ul(class: "space-y-3 mb-6") do
                  plan[:features].each do |feature|
                    li(class: "flex items-center text-gray-700") do
                      span(class: "text-green-500 mr-3") { "✓" }
                      plain(feature)
                    end
                  end
                end
              end

              a(
                href: plan[:button_href] || "#",
                class: "block w-full py-3 px-4 text-center rounded-lg font-semibold #{plan[:featured] ? 'bg-blue-600 text-white hover:bg-blue-700' : 'border border-gray-300 text-gray-900 hover:bg-gray-50'}"
              ) { plain(plan[:button_text] || "Choose Plan") }
            end
          end
        end
      end
    end
  end
end
