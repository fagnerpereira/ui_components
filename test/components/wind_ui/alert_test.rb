# frozen_string_literal: true

require "test_helper"

class Components::WindUI::AlertTest < ActiveSupport::TestCase
  def test_renders_alert
    component = Components::WindUI::Alert.new(title: "Success", message: "Operation completed")
    output = render(component)
    assert_includes output, "Success"
    assert_includes output, "Operation completed"
  end

  def test_renders_success_variant
    component = Components::WindUI::Alert.new(variant: :success, title: "Success", message: "Done")
    output = render(component)
    assert_includes output, "bg-green-50"
  end

  def test_renders_danger_variant
    component = Components::WindUI::Alert.new(variant: :danger, title: "Error", message: "Failed")
    output = render(component)
    assert_includes output, "bg-red-50"
  end

  def test_renders_warning_variant
    component = Components::WindUI::Alert.new(variant: :warning, title: "Warning", message: "Caution")
    output = render(component)
    assert_includes output, "bg-amber-50"
  end

  def test_renders_info_variant
    component = Components::WindUI::Alert.new(variant: :info, title: "Info", message: "Note")
    output = render(component)
    assert_includes output, "bg-cyan-50"
  end

  def test_renders_title
    component = Components::WindUI::Alert.new(title: "Important", message: "Pay attention")
    output = render(component)
    assert_includes output, "Important"
  end

  def test_renders_message
    component = Components::WindUI::Alert.new(message: "This is a message")
    output = render(component)
    assert_includes output, "This is a message"
  end
end
