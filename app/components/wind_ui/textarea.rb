# frozen_string_literal: true

# Textarea component - multi-line text input
#
# Usage:
#   Components::WindUI::Textarea.new(label_text: "Message", placeholder_text: "Enter your message", rows: 4)
class Components::WindUI::Textarea < Components::WindUI::Base
  def initialize(
    label_text: nil,
    placeholder_text: nil,
    rows: 4,
    disabled: false,
    required: false,
    error: nil,
    helper_text: nil,
    class_name: nil,
    **attrs
  )
    @label_text = label_text
    @placeholder_text = placeholder_text
    @rows = rows
    @disabled = disabled
    @required = required
    @error = error
    @helper_text = helper_text
    @class_name = class_name
    @attrs = attrs
  end

  def view_template
    div(class: "w-full") do
      if @label_text.present?
        label_class = "block text-sm font-medium text-gray-900 mb-2"
        label_class += " text-red-600" if @error.present?
        label(class: label_class) do
          plain @label_text
          span(class: "text-red-600") { " *" } if @required
        end
      end

      textarea_class = [
        "w-full px-4 py-2 border rounded-lg font-normal resize-vertical",
        "focus:outline-none focus:ring-2 focus:ring-blue-500 focus:border-transparent",
        "transition-colors duration-200",
        "disabled:bg-gray-100 disabled:cursor-not-allowed disabled:text-gray-500",
        @error.present? ? "border-red-500" : "border-gray-300"
      ].join(" ")

      textarea(
        placeholder: @placeholder_text,
        rows: @rows,
        disabled: @disabled,
        required: @required,
        class: textarea_class,
        **@attrs
      )

      if @error.present?
        p(class: "mt-1 text-sm text-red-600") { @error }
      elsif @helper_text.present?
        p(class: "mt-1 text-sm text-gray-500") { @helper_text }
      end
    end
  end
end
