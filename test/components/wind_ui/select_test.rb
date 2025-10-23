# frozen_string_literal: true

require "test_helper"

class Components::WindUI::SelectTest < ViewComponent::TestCase
  def test_renders_with_defaults
    component = Components::WindUI::Select.new
    render_inline(component)
    assert_select "select"
  end

  def test_renders_with_label_text
    component = Components::WindUI::Select.new(label_text: "Choose option")
    render_inline(component)
    assert_text "Choose option"
  end

  def test_renders_with_options
    options = [["Option 1", "1"], ["Option 2", "2"]]
    component = Components::WindUI::Select.new(options: options)
    render_inline(component)
    assert_text "Option 1"
    assert_text "Option 2"
  end

  def test_renders_with_placeholder
    component = Components::WindUI::Select.new(placeholder_text: "Select...")
    render_inline(component)
    assert_text "Select..."
  end

  def test_renders_with_required
    component = Components::WindUI::Select.new(label_text: "Category", required: true)
    render_inline(component)
    assert_select "select[required]"
    assert_text "*"
  end

  def test_renders_disabled
    component = Components::WindUI::Select.new(disabled: true)
    render_inline(component)
    assert_select "select[disabled]"
  end

  def test_renders_with_error
    component = Components::WindUI::Select.new(error: "Invalid selection")
    render_inline(component)
    assert_text "Invalid selection"
  end

  def test_renders_with_helper_text
    component = Components::WindUI::Select.new(helper_text: "Select from the list")
    render_inline(component)
    assert_text "Select from the list"
  end
end
