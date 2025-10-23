# frozen_string_literal: true

require "test_helper"

class Components::WindUI::InputTest < ActiveSupport::TestCase
  def test_renders_with_defaults
    component = Components::WindUI::Input.new
    output = render(component)
    assert_includes output, "<input"
  end

  def test_renders_with_label_text
    component = Components::WindUI::Input.new(label_text: "Email Address")
    output = render(component)
    assert_includes output, "Email Address"
  end

  def test_renders_with_placeholder_text
    component = Components::WindUI::Input.new(placeholder_text: "Enter email")
    output = render(component)
    assert_includes output, 'placeholder="Enter email"'
  end

  def test_renders_with_type
    component = Components::WindUI::Input.new(type: "email")
    output = render(component)
    assert_includes output, 'type="email"'
  end

  def test_renders_with_required_asterisk
    component = Components::WindUI::Input.new(label_text: "Username", required: true)
    output = render(component)
    assert_includes output, "*"
  end

  def test_renders_disabled_state
    component = Components::WindUI::Input.new(disabled: true)
    output = render(component)
    assert_includes output, "disabled"
  end

  def test_renders_error_state
    component = Components::WindUI::Input.new(error: "This field is required")
    output = render(component)
    assert_includes output, "This field is required"
  end

  def test_renders_helper_text
    component = Components::WindUI::Input.new(helper_text: "Enter a valid email address")
    output = render(component)
    assert_includes output, "Enter a valid email address"
  end

  def test_renders_with_custom_class
    component = Components::WindUI::Input.new(class_name: "custom-class")
    output = render(component)
    assert_includes output, "custom-class"
  end
end
