# frozen_string_literal: true

require "test_helper"

class Components::WindUI::BadgeTest < ViewComponent::TestCase
  def test_renders_badge
    component = Components::WindUI::Badge.new(text: "New")
    render_inline(component)
    assert_text "New"
    assert_select "span.rounded-full"
  end

  def test_renders_with_primary_variant
    component = Components::WindUI::Badge.new(text: "Active", variant: :primary)
    render_inline(component)
    assert_select "span.bg-blue-100"
  end

  def test_renders_with_danger_variant
    component = Components::WindUI::Badge.new(text: "Error", variant: :danger)
    render_inline(component)
    assert_select "span.bg-red-100"
  end

  def test_renders_with_success_variant
    component = Components::WindUI::Badge.new(text: "Success", variant: :success)
    render_inline(component)
    assert_select "span.bg-green-100"
  end

  def test_renders_small_size
    component = Components::WindUI::Badge.new(text: "SM", size: :sm)
    render_inline(component)
    assert_select "span.px-2"
  end

  def test_renders_medium_size
    component = Components::WindUI::Badge.new(text: "MD", size: :md)
    render_inline(component)
    assert_select "span.px-3"
  end

  def test_renders_large_size
    component = Components::WindUI::Badge.new(text: "LG", size: :lg)
    render_inline(component)
    assert_select "span.px-4"
  end
end
