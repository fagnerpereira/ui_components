# frozen_string_literal: true

require "test_helper"

class Components::WindUI::TextareaTest < ViewComponent::TestCase
  def test_renders_with_defaults
    component = Components::WindUI::Textarea.new
    render_inline(component)
    assert_select "textarea"
  end

  def test_renders_with_label_text
    component = Components::WindUI::Textarea.new(label_text: "Message")
    render_inline(component)
    assert_text "Message"
  end

  def test_renders_with_placeholder_text
    component = Components::WindUI::Textarea.new(placeholder_text: "Enter message")
    render_inline(component)
    assert_select "textarea[placeholder='Enter message']"
  end

  def test_renders_with_rows
    component = Components::WindUI::Textarea.new(rows: 5)
    render_inline(component)
    assert_select "textarea[rows='5']"
  end

  def test_renders_with_required
    component = Components::WindUI::Textarea.new(label_text: "Feedback", required: true)
    render_inline(component)
    assert_text "*"
    assert_select "textarea[required]"
  end

  def test_renders_disabled
    component = Components::WindUI::Textarea.new(disabled: true)
    render_inline(component)
    assert_select "textarea[disabled]"
  end

  def test_renders_with_error
    component = Components::WindUI::Textarea.new(error: "Too short")
    render_inline(component)
    assert_text "Too short"
  end

  def test_renders_with_helper_text
    component = Components::WindUI::Textarea.new(helper_text: "Maximum 500 characters")
    render_inline(component)
    assert_text "Maximum 500 characters"
  end
end
