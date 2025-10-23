# frozen_string_literal: true

require "test_helper"

class Components::WindUI::ToggleTest < ActiveSupport::TestCase
  def test_renders_toggle_button
    component = Components::WindUI::Toggle.new
    output = render(component)
    assert_includes output, 'role="switch"'
  end

  def test_renders_with_label_text
    component = Components::WindUI::Toggle.new(label_text: "Enable notifications")
    output = render(component)
    assert_includes output, "Enable notifications"
  end

  def test_renders_checked_state
    component = Components::WindUI::Toggle.new(checked: true)
    output = render(component)
    assert_includes output, 'aria-checked="true"'
  end

  def test_renders_unchecked_state
    component = Components::WindUI::Toggle.new(checked: false)
    output = render(component)
    assert_includes output, 'aria-checked="false"'
  end

  def test_renders_disabled
    component = Components::WindUI::Toggle.new(disabled: true)
    output = render(component)
    assert_includes output, "disabled"
  end

  def test_renders_small_size
    component = Components::WindUI::Toggle.new(size: :sm)
    output = render(component)
    assert_includes output, "w-10"
  end

  def test_renders_medium_size
    component = Components::WindUI::Toggle.new(size: :md)
    output = render(component)
    assert_includes output, "w-12"
  end

  def test_renders_large_size
    component = Components::WindUI::Toggle.new(size: :lg)
    output = render(component)
    assert_includes output, "w-14"
  end

  def test_renders_hidden_checkbox
    component = Components::WindUI::Toggle.new
    output = render(component)
    assert_includes output, "sr-only"
  end
end
