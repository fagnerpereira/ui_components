import { Controller } from "@hotwired/stimulus"

// Toggle controller - handles switch/toggle state management
// Connects to data-controller="toggle"
export default class extends Controller {
  static targets = ["button", "input", "dot"]
  static classes = ["on", "off"]
  static values = {
    checked: { type: Boolean, default: false }
  }

  connect() {
    // Initialize state
    this.updateState(this.checkedValue)
  }

  // Toggle the switch
  toggle() {
    if (this.buttonTarget.disabled) return
    
    this.checkedValue = !this.checkedValue
    this.updateState(this.checkedValue)
    
    // Dispatch custom event for external listeners
    this.dispatch("change", { detail: { checked: this.checkedValue } })
    
    // Update hidden input if present (for form submission)
    if (this.hasInputTarget) {
      this.inputTarget.checked = this.checkedValue
      // Trigger change event on input
      this.inputTarget.dispatchEvent(new Event("change", { bubbles: true }))
    }
  }

  // Update visual state
  updateState(checked) {
    this.checkedValue = checked
    
    // Update button
    this.buttonTarget.setAttribute("aria-checked", checked)
    
    // Update classes
    if (this.hasOnClass && this.hasOffClass) {
      this.buttonTarget.classList.toggle(this.onClass, checked)
      this.buttonTarget.classList.toggle(this.offClass, !checked)
    }
    
    // Update dot position if using custom dot target
    if (this.hasDotTarget) {
      const translateClass = this.buttonTarget.dataset.translateClass
      if (translateClass) {
        if (checked) {
          this.dotTarget.classList.add(...translateClass.split(" "))
        } else {
          this.dotTarget.classList.remove(...translateClass.split(" "))
        }
      }
    }
  }

  // Keyboard support
  handleKeydown(event) {
    if (event.key === " " || event.key === "Enter") {
      event.preventDefault()
      this.toggle()
    }
  }

  // Allow setting value programmatically
  checkedValueChanged() {
    this.updateState(this.checkedValue)
  }
}
