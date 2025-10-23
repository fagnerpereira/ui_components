# frozen_string_literal: true

require "test_helper"

class Components::WindUI::TextareaTest < ActiveSupport::TestCase
  def test_renders_with_defaults
    component = Components::WindUI::Textarea.new
    output = render(component)
    assert_includes output, "<textarea"
  end

  def test_renders_with_label_text
    component = Components::WindUI::Textarea.new(label_text: "Message")
    output = render(component)
    assert_includes output, "Message"
  end

  def test_renders_with_placeholder_text
    component = Components::WindUI::Textarea.new(placeholder_text: "Enter message")
    output = render(component)
    assert_includes output, 'placeholder="Enter message"'
  end

  def test_renders_with_rows
    component = Components::WindUI::Textarea.new(rows: 5)
    output = render(component)
    assert_includes output, 'rows="5"'
  end

  def test_renders_with_required
    component = Components::WindUI::Textarea.new(label_text: "Feedback", required: true)
    output = render(component)
    assert_includes output, "*"
    assert_includes output, "required"
  end

  def test_renders_disabled
    component = Components::WindUI::Textarea.new(disabled: true)
    output = render(component)
    assert_includes output, "disabled"
  end

  def test_renders_with_error
    component = Components::WindUI::Textarea.new(error: "Too short")
    output = render(component)
    assert_includes output, "Too short"
  end

  def test_renders_with_helper_text
    component = Components::WindUI::Textarea.new(helper_text: "Maximum 500 characters")
    output = render(component)
    assert_includes output, "Maximum 500 characters"
  end
end
