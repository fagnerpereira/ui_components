# frozen_string_literal: true

require "test_helper"

class Components::WindUI::RadioTest < ActiveSupport::TestCase
  def test_renders_radio_input
    component = Components::WindUI::Radio.new
    output = render(component)
    assert_includes output, 'type="radio"'
  end

  def test_renders_with_label_text
    component = Components::WindUI::Radio.new(label_text: "Option A")
    output = render(component)
    assert_includes output, "Option A"
  end

  def test_renders_with_value
    component = Components::WindUI::Radio.new(value: "a")
    output = render(component)
    assert_includes output, 'value="a"'
  end

  def test_renders_checked_state
    component = Components::WindUI::Radio.new(checked: true)
    output = render(component)
    assert_includes output, "checked"
  end

  def test_renders_unchecked_state
    component = Components::WindUI::Radio.new(checked: false)
    output = render(component)
    refute_includes output, "checked"
  end

  def test_renders_disabled
    component = Components::WindUI::Radio.new(disabled: true)
    output = render(component)
    assert_includes output, "disabled"
  end

  def test_renders_required
    component = Components::WindUI::Radio.new(required: true)
    output = render(component)
    assert_includes output, "required"
  end

  def test_renders_with_name_attribute
    component = Components::WindUI::Radio.new(name: "choice")
    output = render(component)
    assert_includes output, 'name="choice"'
  end
end
