# frozen_string_literal: true

require "test_helper"

class Components::WindUI::ButtonTest < ViewComponent::TestCase
  def test_renders_button
    component = Components::WindUI::Button.new(text: "Click me")
    render_inline(component)
    assert_text "Click me"
    assert_select "button"
  end

  def test_renders_with_primary_variant
    component = Components::WindUI::Button.new(text: "Submit", variant: :primary)
    render_inline(component)
    assert_select "button.bg-blue-600"
  end

  def test_renders_with_secondary_variant
    component = Components::WindUI::Button.new(text: "Cancel", variant: :secondary)
    render_inline(component)
    assert_select "button.bg-gray-600"
  end

  def test_renders_with_danger_variant
    component = Components::WindUI::Button.new(text: "Delete", variant: :danger)
    render_inline(component)
    assert_select "button.bg-red-600"
  end

  def test_renders_small_size
    component = Components::WindUI::Button.new(text: "Small", size: :sm)
    render_inline(component)
    assert_select "button.px-3"
  end

  def test_renders_medium_size
    component = Components::WindUI::Button.new(text: "Medium", size: :md)
    render_inline(component)
    assert_select "button.px-4"
  end

  def test_renders_large_size
    component = Components::WindUI::Button.new(text: "Large", size: :lg)
    render_inline(component)
    assert_select "button.px-6"
  end

  def test_renders_disabled
    component = Components::WindUI::Button.new(text: "Disabled", disabled: true)
    render_inline(component)
    assert_select "button[disabled]"
  end

  def test_renders_with_full_width
    component = Components::WindUI::Button.new(text: "Full Width", full_width: true)
    render_inline(component)
    assert_select "button.w-full"
  end
end
