# frozen_string_literal: true

require "test_helper"

class Components::WindUI::ToggleTest < ViewComponent::TestCase
  def test_renders_toggle_button
    component = Components::WindUI::Toggle.new
    render_inline(component)
    assert_select "button[role='switch']"
  end

  def test_renders_with_label_text
    component = Components::WindUI::Toggle.new(label_text: "Enable notifications")
    render_inline(component)
    assert_text "Enable notifications"
  end

  def test_renders_checked_state
    component = Components::WindUI::Toggle.new(checked: true)
    render_inline(component)
    assert_select "button[aria-checked='true']"
  end

  def test_renders_unchecked_state
    component = Components::WindUI::Toggle.new(checked: false)
    render_inline(component)
    assert_select "button[aria-checked='false']"
  end

  def test_renders_disabled
    component = Components::WindUI::Toggle.new(disabled: true)
    render_inline(component)
    assert_select "button[disabled]"
  end

  def test_renders_small_size
    component = Components::WindUI::Toggle.new(size: :sm)
    render_inline(component)
    assert_select "button.w-10"
  end

  def test_renders_medium_size
    component = Components::WindUI::Toggle.new(size: :md)
    render_inline(component)
    assert_select "button.w-12"
  end

  def test_renders_large_size
    component = Components::WindUI::Toggle.new(size: :lg)
    render_inline(component)
    assert_select "button.w-14"
  end

  def test_renders_hidden_checkbox
    component = Components::WindUI::Toggle.new
    render_inline(component)
    assert_select "input[type='checkbox'].sr-only"
  end
end
