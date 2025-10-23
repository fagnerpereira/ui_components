# frozen_string_literal: true

require "test_helper"

class Components::WindUI::ButtonTest < ActiveSupport::TestCase
  def test_renders_button
    component = Components::WindUI::Button.new(text: "Click me")
    output = render(component)
    assert_includes output, "Click me"
    assert_includes output, "<button"
  end

  def test_renders_with_primary_variant
    component = Components::WindUI::Button.new(text: "Submit", variant: :primary)
    output = render(component)
    assert_includes output, "bg-blue-600"
  end

  def test_renders_with_secondary_variant
    component = Components::WindUI::Button.new(text: "Cancel", variant: :secondary)
    output = render(component)
    assert_includes output, "bg-gray-600"
  end

  def test_renders_with_danger_variant
    component = Components::WindUI::Button.new(text: "Delete", variant: :danger)
    output = render(component)
    assert_includes output, "bg-red-600"
  end

  def test_renders_small_size
    component = Components::WindUI::Button.new(text: "Small", size: :sm)
    output = render(component)
    assert_includes output, "px-3"
  end

  def test_renders_medium_size
    component = Components::WindUI::Button.new(text: "Medium", size: :md)
    output = render(component)
    assert_includes output, "px-4"
  end

  def test_renders_large_size
    component = Components::WindUI::Button.new(text: "Large", size: :lg)
    output = render(component)
    assert_includes output, "px-6"
  end

  def test_renders_disabled
    component = Components::WindUI::Button.new(text: "Disabled", disabled: true)
    output = render(component)
    assert_includes output, "disabled"
  end

  def test_renders_with_full_width
    component = Components::WindUI::Button.new(text: "Full Width", full_width: true)
    output = render(component)
    assert_includes output, "w-full"
  end
end
