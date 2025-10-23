# frozen_string_literal: true

require "test_helper"

class Components::WindUI::CheckboxTest < ViewComponent::TestCase
  def test_renders_checkbox_input
    component = Components::WindUI::Checkbox.new
    render_inline(component)
    assert_select "input[type='checkbox']"
  end

  def test_renders_with_label_text
    component = Components::WindUI::Checkbox.new(label_text: "Accept terms")
    render_inline(component)
    assert_text "Accept terms"
  end

  def test_renders_checked_state
    component = Components::WindUI::Checkbox.new(checked: true)
    render_inline(component)
    assert_select "input[type='checkbox'][checked]"
  end

  def test_renders_unchecked_state
    component = Components::WindUI::Checkbox.new(checked: false)
    render_inline(component)
    assert_select "input[type='checkbox']:not([checked])"
  end

  def test_renders_disabled
    component = Components::WindUI::Checkbox.new(disabled: true)
    render_inline(component)
    assert_select "input[type='checkbox'][disabled]"
  end

  def test_renders_required
    component = Components::WindUI::Checkbox.new(required: true)
    render_inline(component)
    assert_select "input[type='checkbox'][required]"
  end

  def test_renders_with_custom_class
    component = Components::WindUI::Checkbox.new(class_name: "custom-checkbox")
    render_inline(component)
    assert_select "input[type='checkbox'].custom-checkbox"
  end
end
