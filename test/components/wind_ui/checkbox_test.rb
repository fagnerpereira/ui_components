# frozen_string_literal: true

require "test_helper"

class Components::WindUI::CheckboxTest < ActiveSupport::TestCase
  def test_renders_checkbox_input
    component = Components::WindUI::Checkbox.new
    output = render(component)
    assert_includes output, 'type="checkbox"'
  end

  def test_renders_with_label_text
    component = Components::WindUI::Checkbox.new(label_text: "Accept terms")
    output = render(component)
    assert_includes output, "Accept terms"
  end

  def test_renders_checked_state
    component = Components::WindUI::Checkbox.new(checked: true)
    output = render(component)
    assert_includes output, "checked"
  end

  def test_renders_unchecked_state
    component = Components::WindUI::Checkbox.new(checked: false)
    output = render(component)
    refute_includes output, "checked"
  end

  def test_renders_disabled
    component = Components::WindUI::Checkbox.new(disabled: true)
    output = render(component)
    assert_includes output, "disabled"
  end

  def test_renders_required
    component = Components::WindUI::Checkbox.new(required: true)
    output = render(component)
    assert_includes output, "required"
  end

  def test_renders_with_custom_class
    component = Components::WindUI::Checkbox.new(class_name: "custom-checkbox")
    output = render(component)
    assert_includes output, "custom-checkbox"
  end
end
