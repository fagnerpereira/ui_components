import { Controller } from "@hotwired/stimulus"

// Tooltip controller - handles showing/hiding tooltips on hover
// Connects to data-controller="tooltip"
export default class extends Controller {
  static targets = ["content"]
  static classes = ["hidden", "visible"]
  static values = {
    delay: { type: Number, default: 200 }
  }

  connect() {
    this.timeout = null
  }

  disconnect() {
    this.clearTimeout()
  }

  // Show tooltip with delay
  show() {
    this.clearTimeout()
    
    this.timeout = setTimeout(() => {
      if (this.hasContentTarget) {
        this.contentTarget.classList.remove(this.hiddenClass)
        this.contentTarget.classList.add(this.visibleClass)
      }
    }, this.delayValue)
  }

  // Hide tooltip immediately
  hide() {
    this.clearTimeout()
    
    if (this.hasContentTarget) {
      this.contentTarget.classList.add(this.hiddenClass)
      this.contentTarget.classList.remove(this.visibleClass)
    }
  }

  // Clear any pending timeout
  clearTimeout() {
    if (this.timeout) {
      clearTimeout(this.timeout)
      this.timeout = null
    }
  }
}
