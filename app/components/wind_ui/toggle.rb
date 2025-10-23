# frozen_string_literal: true

# Toggle/Switch component
#
# Usage:
#   Components::WindUI::Toggle.new(label_text: "Enable notifications", checked: true)
#   Components::WindUI::Toggle.new(checked: false, size: :lg)
class Components::WindUI::Toggle < Components::WindUI::Base
  TOGGLE_SIZES = {
    sm: { bg: "w-10 h-6", dot: "w-5 h-5", translate: "translate-x-4" },
    md: { bg: "w-12 h-7", dot: "w-6 h-6", translate: "translate-x-5" },
    lg: { bg: "w-14 h-8", dot: "w-7 h-7", translate: "translate-x-6" }
  }.freeze

  attr_reader :label_text, :checked, :disabled, :size, :class_name

  def initialize(label_text: nil, checked: false, disabled: false, size: :md, class_name: nil, **attrs)
    @label_text = label_text
    @checked = checked
    @disabled = disabled
    @size = size
    @class_name = class_name
    @attrs = attrs
  end

  def view_template
    config = TOGGLE_SIZES[@size.to_sym] || TOGGLE_SIZES[:md]

    div(
      class: "flex items-center",
      data: {
        controller: "toggle",
        toggle_checked_value: @checked,
        toggle_on_class: "bg-blue-600",
        toggle_off_class: "bg-gray-300"
      }
    ) do
      # Hidden checkbox input for form submission
      input(
        type: "checkbox",
        class: "sr-only",
        checked: @checked,
        disabled: @disabled,
        data: { toggle_target: "input" },
        **@attrs
      )

      # Toggle background
      button_class = [
        config[:bg],
        "relative inline-block rounded-full transition-colors duration-200",
        "focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-blue-500",
        "disabled:opacity-50 disabled:cursor-not-allowed",
        @checked ? "bg-blue-600" : "bg-gray-300",
        @class_name
      ].filter_map { |c| c if c.present? }.join(" ")

      button(
        type: "button",
        class: button_class,
        disabled: @disabled,
        role: "switch",
        data: {
          toggle_target: "button",
          action: "click->toggle#toggle keydown->toggle#handleKeydown",
          translate_class: config[:translate]
        },
        aria: { checked: @checked }
      ) do
        # Toggle dot
        dot_class = [
          config[:dot],
          "absolute top-1/2 -translate-y-1/2 left-1 bg-white rounded-full transition-transform duration-200",
          @checked ? config[:translate] : ""
        ].filter_map { |c| c if c.present? }.join(" ")

        div(class: dot_class, data: { toggle_target: "dot" })
      end

      if @label_text.present?
        label(class: "ml-3 text-sm font-medium text-gray-900") do
          plain @label_text
        end
      end
    end
  end
end
