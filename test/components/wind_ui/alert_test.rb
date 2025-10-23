# frozen_string_literal: true

require "test_helper"

class Components::WindUI::AlertTest < ViewComponent::TestCase
  def test_renders_alert
    component = Components::WindUI::Alert.new(title: "Success", message: "Operation completed")
    render_inline(component)
    assert_text "Success"
    assert_text "Operation completed"
  end

  def test_renders_success_variant
    component = Components::WindUI::Alert.new(variant: :success, title: "Success", message: "Done")
    render_inline(component)
    assert_select "div.bg-green-50"
  end

  def test_renders_danger_variant
    component = Components::WindUI::Alert.new(variant: :danger, title: "Error", message: "Failed")
    render_inline(component)
    assert_select "div.bg-red-50"
  end

  def test_renders_warning_variant
    component = Components::WindUI::Alert.new(variant: :warning, title: "Warning", message: "Caution")
    render_inline(component)
    assert_select "div.bg-amber-50"
  end

  def test_renders_info_variant
    component = Components::WindUI::Alert.new(variant: :info, title: "Info", message: "Note")
    render_inline(component)
    assert_select "div.bg-cyan-50"
  end

  def test_renders_title
    component = Components::WindUI::Alert.new(title: "Important", message: "Pay attention")
    render_inline(component)
    assert_text "Important"
  end

  def test_renders_message
    component = Components::WindUI::Alert.new(message: "This is a message")
    render_inline(component)
    assert_text "This is a message"
  end
end
