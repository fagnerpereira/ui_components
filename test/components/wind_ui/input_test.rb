# frozen_string_literal: true

require "test_helper"

class Components::WindUI::InputTest < ViewComponent::TestCase
  def test_renders_with_defaults
    component = Components::WindUI::Input.new
    render_inline(component)
    assert_text ""
  end

  def test_renders_with_label_text
    component = Components::WindUI::Input.new(label_text: "Email Address")
    render_inline(component)
    assert_text "Email Address"
  end

  def test_renders_with_placeholder_text
    component = Components::WindUI::Input.new(placeholder_text: "Enter email")
    render_inline(component)
    assert_select "input[placeholder='Enter email']"
  end

  def test_renders_with_type
    component = Components::WindUI::Input.new(type: "email")
    render_inline(component)
    assert_select "input[type='email']"
  end

  def test_renders_with_required_asterisk
    component = Components::WindUI::Input.new(label_text: "Username", required: true)
    render_inline(component)
    assert_text "*"
  end

  def test_renders_disabled_state
    component = Components::WindUI::Input.new(disabled: true)
    render_inline(component)
    assert_select "input[disabled]"
  end

  def test_renders_error_state
    component = Components::WindUI::Input.new(error: "This field is required")
    render_inline(component)
    assert_text "This field is required"
  end

  def test_renders_helper_text
    component = Components::WindUI::Input.new(helper_text: "Enter a valid email address")
    render_inline(component)
    assert_text "Enter a valid email address"
  end

  def test_renders_with_custom_class
    component = Components::WindUI::Input.new(class_name: "custom-class")
    render_inline(component)
    assert_select "input.custom-class"
  end
end
