# frozen_string_literal: true

require "test_helper"

class Components::WindUI::BadgeTest < ActiveSupport::TestCase
  def test_renders_badge
    component = Components::WindUI::Badge.new(text: "New")
    output = render(component)
    assert_includes output, "New"
    assert_includes output, "rounded-full"
  end

  def test_renders_with_primary_variant
    component = Components::WindUI::Badge.new(text: "Active", variant: :primary)
    output = render(component)
    assert_includes output, "bg-blue-100"
  end

  def test_renders_with_danger_variant
    component = Components::WindUI::Badge.new(text: "Error", variant: :danger)
    output = render(component)
    assert_includes output, "bg-red-100"
  end

  def test_renders_with_success_variant
    component = Components::WindUI::Badge.new(text: "Success", variant: :success)
    output = render(component)
    assert_includes output, "bg-green-100"
  end

  def test_renders_small_size
    component = Components::WindUI::Badge.new(text: "SM", size: :sm)
    output = render(component)
    assert_includes output, "px-2"
  end

  def test_renders_medium_size
    component = Components::WindUI::Badge.new(text: "MD", size: :md)
    output = render(component)
    assert_includes output, "px-3"
  end

  def test_renders_large_size
    component = Components::WindUI::Badge.new(text: "LG", size: :lg)
    output = render(component)
    assert_includes output, "px-4"
  end
end
