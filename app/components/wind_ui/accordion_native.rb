# frozen_string_literal: true

# Native Accordion component - collapsible content sections using <details>
# Follows Wind UI's recommended approach with native HTML elements
# Uses <details> and <summary> for built-in accessibility
#
# Usage:
#   Components::WindUI::AccordionNative.new(
#     items: [
#       { title: "Section 1", content: "Content 1" },
#       { title: "Section 2", content: "Content 2" }
#     ],
#     variant: :basic  # :basic, :outline, :elevated
#   )
class Components::WindUI::AccordionNative < Components::WindUI::Base
  VARIANTS = {
    basic: "border-b border-gray-200 last:border-b-0",
    outline: "border border-gray-200 rounded-lg mb-2",
    elevated: "border border-gray-200 rounded-lg shadow-sm mb-2"
  }.freeze

  attr_reader :items, :variant, :class_name

  def initialize(items: [], variant: :basic, class_name: nil, **attrs)
    @items = items
    @variant = variant
    @class_name = class_name
    @attrs = attrs
  end

  def view_template
    container_class = if variant == :basic
      ["space-y-0 border border-gray-200 rounded-lg", class_name].compact.join(" ")
    else
      ["space-y-0", class_name].compact.join(" ")
    end

    div(class: container_class, **@attrs) do
      items.each do |item|
        render_accordion_item(item)
      end
    end
  end

  private

  def render_accordion_item(item)
    item_class = VARIANTS[variant.to_sym] || VARIANTS[:basic]

    # Native <details> element as per Wind UI spec
    details(class: item_class) do
      # Native <summary> element
      summary(
        class: "w-full px-6 py-4 text-left font-medium text-gray-900 cursor-pointer hover:bg-gray-50 flex items-center justify-between"
      ) do
        plain(item[:title])
        
        # Icon (optional)
        if item[:icon] != false
          svg(
            xmlns: "http://www.w3.org/2000/svg",
            class: "w-6 h-6 text-gray-400 transition-transform duration-300",
            fill: "none",
            viewBox: "0 0 24 24",
            stroke: "currentColor",
            stroke_width: "1.5"
          ) do |s|
            s.path(
              stroke_linecap: "round",
              stroke_linejoin: "round",
              d: "M19.5 8.25l-7.5 7.5-7.5-7.5"
            )
          end
        end
      end

      # Content
      div(class: "px-6 pb-4 text-gray-700") do
        plain(item[:content])
      end
    end
  end
end
