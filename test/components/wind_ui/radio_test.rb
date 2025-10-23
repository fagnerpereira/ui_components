# frozen_string_literal: true

require "test_helper"

class Components::WindUI::RadioTest < ViewComponent::TestCase
  def test_renders_radio_input
    component = Components::WindUI::Radio.new
    render_inline(component)
    assert_select "input[type='radio']"
  end

  def test_renders_with_label_text
    component = Components::WindUI::Radio.new(label_text: "Option A")
    render_inline(component)
    assert_text "Option A"
  end

  def test_renders_with_value
    component = Components::WindUI::Radio.new(value: "a")
    render_inline(component)
    assert_select "input[type='radio'][value='a']"
  end

  def test_renders_checked_state
    component = Components::WindUI::Radio.new(checked: true)
    render_inline(component)
    assert_select "input[type='radio'][checked]"
  end

  def test_renders_unchecked_state
    component = Components::WindUI::Radio.new(checked: false)
    render_inline(component)
    assert_select "input[type='radio']:not([checked])"
  end

  def test_renders_disabled
    component = Components::WindUI::Radio.new(disabled: true)
    render_inline(component)
    assert_select "input[type='radio'][disabled]"
  end

  def test_renders_required
    component = Components::WindUI::Radio.new(required: true)
    render_inline(component)
    assert_select "input[type='radio'][required]"
  end

  def test_renders_with_name_attribute
    component = Components::WindUI::Radio.new(name: "choice")
    render_inline(component)
    assert_select "input[type='radio'][name='choice']"
  end
end
