import { Controller } from "@hotwired/stimulus"

// Dropdown controller - handles toggle behavior for dropdown menus
// Connects to data-controller="dropdown"
export default class extends Controller {
  static targets = ["menu", "trigger"]
  static classes = ["hidden"]

  connect() {
    // Close dropdown when clicking outside
    this.boundClose = this.closeOnClickOutside.bind(this)
    document.addEventListener("click", this.boundClose)
  }

  disconnect() {
    document.removeEventListener("click", this.boundClose)
  }

  // Toggle dropdown visibility
  toggle(event) {
    event.stopPropagation()
    this.menuTarget.classList.toggle(this.hiddenClass)
    
    // Update aria-expanded attribute
    const isExpanded = !this.menuTarget.classList.contains(this.hiddenClass)
    this.triggerTarget.setAttribute("aria-expanded", isExpanded)
  }

  // Close dropdown
  close() {
    this.menuTarget.classList.add(this.hiddenClass)
    this.triggerTarget.setAttribute("aria-expanded", "false")
  }

  // Close when clicking outside the dropdown
  closeOnClickOutside(event) {
    if (!this.element.contains(event.target)) {
      this.close()
    }
  }

  // Handle keyboard navigation (Escape to close)
  handleKeydown(event) {
    if (event.key === "Escape") {
      this.close()
      this.triggerTarget.focus()
    }
  }
}
