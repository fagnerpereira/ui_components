# frozen_string_literal: true

# Input component - text input field
#
# Usage:
#   Components::WindUI::Input.new(placeholder_text: "Enter text", size: :md)
#   Components::WindUI::Input.new(label_text: "Email", type: "email", required: true)
class Components::WindUI::Input < Components::WindUI::Base
  def initialize(
    label_text: nil,
    placeholder_text: nil,
    type: "text",
    size: :md,
    disabled: false,
    required: false,
    error: nil,
    helper_text: nil,
    class_name: nil,
    **attrs
  )
    @label_text = label_text
    @placeholder_text = placeholder_text
    @type = type
    @size = size
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

      input_class = [
        "w-full px-4 py-2 border rounded-lg font-normal",
        "focus:outline-none focus:ring-2 focus:ring-blue-500 focus:border-transparent",
        "transition-colors duration-200",
        "disabled:bg-gray-100 disabled:cursor-not-allowed disabled:text-gray-500",
        @error.present? ? "border-red-500" : "border-gray-300"
      ].join(" ")

      input(
        type: @type,
        placeholder: @placeholder_text,
        disabled: @disabled,
        required: @required,
        class: input_class,
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
