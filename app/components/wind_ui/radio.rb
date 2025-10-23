# frozen_string_literal: true

# Radio component
#
# Usage:
#   Components::WindUI::Radio.new(label_text: "Option 1", name: "choice", value: "1")
class Components::WindUI::Radio < Components::WindUI::Base
  attr_reader :label_text, :value, :checked, :disabled, :required, :class_name

  def initialize(label_text: nil, value: nil, checked: false, disabled: false, required: false, class_name: nil, **attrs)
    @label_text = label_text
    @value = value
    @checked = checked
    @disabled = disabled
    @required = required
    @class_name = class_name
    @attrs = attrs
  end

  def view_template
    div(class: "flex items-center") do
      input_class = [
        "w-4 h-4 text-blue-600 border-gray-300",
        "focus:ring-blue-500 focus:ring-2",
        "disabled:cursor-not-allowed disabled:opacity-50",
        @class_name
      ].filter_map { |c| c if c.present? }.join(" ")

      input(
        type: "radio",
        class: input_class,
        value: @value,
        checked: @checked,
        disabled: @disabled,
        required: @required,
        **@attrs
      )

      if @label_text.present?
        label(class: "ml-2 text-sm font-medium text-gray-900 cursor-pointer") do
          plain @label_text
        end
      end
    end
  end
end
