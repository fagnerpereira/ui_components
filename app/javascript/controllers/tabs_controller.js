import { Controller } from "@hotwired/stimulus"

// Tabs controller - handles tab switching and panel visibility
// Connects to data-controller="tabs"
export default class extends Controller {
  static targets = ["tab", "panel"]
  static classes = ["active", "inactive"]
  static values = {
    index: { type: Number, default: 0 }
  }

  connect() {
    // Show the default tab
    this.showTab(this.indexValue)
  }

  // Switch to a specific tab
  select(event) {
    const index = parseInt(event.currentTarget.dataset.index)
    this.showTab(index)
  }

  // Show tab by index
  showTab(index) {
    this.indexValue = index

    // Update all tabs and panels
    this.tabTargets.forEach((tab, i) => {
      const isActive = i === index
      
      // Update tab styling
      if (this.hasActiveClass && this.hasInactiveClass) {
        tab.classList.toggle(this.activeClass, isActive)
        tab.classList.toggle(this.inactiveClass, !isActive)
      }
      
      // Update aria attributes
      tab.setAttribute("aria-selected", isActive)
      tab.setAttribute("tabindex", isActive ? "0" : "-1")
    })

    // Show/hide panels
    this.panelTargets.forEach((panel, i) => {
      const isActive = i === index
      panel.hidden = !isActive
      
      // Update aria-hidden as per Wind UI specs
      panel.setAttribute("aria-hidden", !isActive)
      
      // Also toggle classes for custom styling
      panel.classList.toggle("block", isActive)
      panel.classList.toggle("hidden", !isActive)
    })
  }

  // Keyboard navigation support
  handleKeydown(event) {
    const currentIndex = parseInt(event.currentTarget.dataset.index)
    let newIndex = currentIndex

    switch (event.key) {
      case "ArrowLeft":
        event.preventDefault()
        newIndex = currentIndex > 0 ? currentIndex - 1 : this.tabTargets.length - 1
        break
      case "ArrowRight":
        event.preventDefault()
        newIndex = currentIndex < this.tabTargets.length - 1 ? currentIndex + 1 : 0
        break
      case "Home":
        event.preventDefault()
        newIndex = 0
        break
      case "End":
        event.preventDefault()
        newIndex = this.tabTargets.length - 1
        break
      default:
        return
    }

    this.showTab(newIndex)
    this.tabTargets[newIndex].focus()
  }
}
