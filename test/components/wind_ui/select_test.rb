# frozen_string_literal: true

require "test_helper"

class Components::WindUI::SelectTest < ActiveSupport::TestCase
  def test_renders_with_defaults
    component = Components::WindUI::Select.new
    output = render(component)
    assert_includes output, "<select"
  end

  def test_renders_with_label_text
    component = Components::WindUI::Select.new(label_text: "Choose option")
    output = render(component)
    assert_includes output, "Choose option"
  end

  def test_renders_with_options
    options = [["Option 1", "1"], ["Option 2", "2"]]
    component = Components::WindUI::Select.new(options: options)
    output = render(component)
    assert_includes output, "Option 1"
    assert_includes output, "Option 2"
  end

  def test_renders_with_placeholder
    component = Components::WindUI::Select.new(placeholder_text: "Select...")
    output = render(component)
    assert_includes output, "Select..."
  end

  def test_renders_with_required
    component = Components::WindUI::Select.new(label_text: "Category", required: true)
    output = render(component)
    assert_includes output, "required"
    assert_includes output, "*"
  end

  def test_renders_disabled
    component = Components::WindUI::Select.new(disabled: true)
    output = render(component)
    assert_includes output, "disabled"
  end

  def test_renders_with_error
    component = Components::WindUI::Select.new(error: "Invalid selection")
    output = render(component)
    assert_includes output, "Invalid selection"
  end

  def test_renders_with_helper_text
    component = Components::WindUI::Select.new(helper_text: "Select from the list")
    output = render(component)
    assert_includes output, "Select from the list"
  end
end
