# frozen_string_literal: true

# Alert component - displays alert messages with icons and styling
#
# Usage:
#   Components::WindUI::Alert.new(title: "Success", message: "Operation completed", variant: :success)
#   Components::WindUI::Alert.new(title: "Error", message: "Something went wrong", variant: :danger, dismissible: true)
class Components::WindUI::Alert < Components::WindUI::Base
  ALERT_VARIANTS = {
    success: {
      bg: "bg-green-50",
      border: "border-l-4 border-green-400",
      title: "text-green-800",
      text: "text-green-700",
      icon: "✓"
    },
    danger: {
      bg: "bg-red-50",
      border: "border-l-4 border-red-400",
      title: "text-red-800",
      text: "text-red-700",
      icon: "!"
    },
    warning: {
      bg: "bg-amber-50",
      border: "border-l-4 border-amber-400",
      title: "text-amber-800",
      text: "text-amber-700",
      icon: "⚠"
    },
    info: {
      bg: "bg-cyan-50",
      border: "border-l-4 border-cyan-400",
      title: "text-cyan-800",
      text: "text-cyan-700",
      icon: "ⓘ"
    }
  }.freeze

  attr_reader :title, :message, :variant, :dismissible, :class_name

  def initialize(title: nil, message: nil, variant: :info, dismissible: false, class_name: nil, **attrs)
    @title = title
    @message = message
    @variant = variant
    @dismissible = dismissible
    @class_name = class_name
    @attrs = attrs
  end

  def view_template
    config = ALERT_VARIANTS[variant.to_sym] || ALERT_VARIANTS[:info]

    component_class = [
      "p-4 rounded-lg",
      config[:bg],
      config[:border],
      class_name
    ].filter_map { |c| c if c.present? }.join(" ")

    div(class: component_class, **@attrs) do
      div(class: "flex items-start") do
        div(class: "flex-shrink-0 mr-3 text-lg font-bold #{config[:title]}") do
          plain(config[:icon])
        end

        div(class: "flex-1") do
          if title.present?
            h3(class: "font-semibold #{config[:title]}") { plain(title) }
          end

          if message.present?
            p(class: "mt-1 #{config[:text]}") { plain(message) }
          end
        end

        if dismissible
          button(
            type: "button",
            class: "flex-shrink-0 ml-3 text-gray-400 hover:text-gray-500 focus:outline-none",
            "aria-label": "Close alert"
          ) do
            plain("×")
          end
        end
      end
    end
  end
end
