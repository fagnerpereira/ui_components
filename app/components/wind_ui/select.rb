# frozen_string_literal: true

# Select component - dropdown selection
#
# Usage:
#   Components::WindUI::Select.new(
#     label_text: "Choose option",
#     options: [["Option 1", "1"], ["Option 2", "2"]],
#     placeholder_text: "Select..."
#   )
class Components::WindUI::Select < Components::WindUI::Base
  def initialize(
    label_text: nil,
    options: [],
    placeholder_text: nil,
    disabled: false,
    required: false,
    error: nil,
    helper_text: nil,
    class_name: nil,
    **attrs
  )
    @label_text = label_text
    @options_list = options
    @placeholder_text = placeholder_text
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

      select_class = [
        "w-full px-4 py-2 border rounded-lg font-normal",
        "focus:outline-none focus:ring-2 focus:ring-blue-500 focus:border-transparent",
        "transition-colors duration-200",
        "disabled:bg-gray-100 disabled:cursor-not-allowed disabled:text-gray-500",
        @error.present? ? "border-red-500" : "border-gray-300"
      ].join(" ")

      select(
        disabled: @disabled,
        required: @required,
        class: select_class,
        **@attrs
      ) do
        if @placeholder_text.present?
          option(value: "", disabled: true, selected: true) { @placeholder_text }
        end

        @options_list.each do |text, value|
          option(value: value) { text }
        end
      end

      if @error.present?
        p(class: "mt-1 text-sm text-red-600") { @error }
      elsif @helper_text.present?
        p(class: "mt-1 text-sm text-gray-500") { @helper_text }
      end
    end
  end
end
