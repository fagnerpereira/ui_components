import { Controller } from "@hotwired/stimulus"

// Accordion controller - handles expand/collapse of accordion items
// Connects to data-controller="accordion"
export default class extends Controller {
  static targets = ["item", "trigger", "content", "icon"]
  static values = {
    allowMultiple: { type: Boolean, default: false }
  }

  // Toggle specific accordion item
  toggle(event) {
    const trigger = event.currentTarget
    const index = this.triggerTargets.indexOf(trigger)
    const content = this.contentTargets[index]
    const icon = this.hasIconTarget ? this.iconTargets[index] : null
    const isExpanded = trigger.getAttribute("aria-expanded") === "true"

    if (!this.allowMultipleValue && !isExpanded) {
      // Close all other items if only one can be open
      this.closeAll()
    }

    // Toggle this item
    if (isExpanded) {
      this.closeItem(index)
    } else {
      this.openItem(index)
    }
  }

  // Open specific item
  openItem(index) {
    const trigger = this.triggerTargets[index]
    const content = this.contentTargets[index]
    const icon = this.hasIconTarget ? this.iconTargets[index] : null

    trigger.setAttribute("aria-expanded", "true")
    content.classList.remove("hidden")
    content.classList.add("block")
    
    // Rotate icon if present
    if (icon) {
      icon.style.transform = "rotate(180deg)"
    }

    // Smooth height animation
    this.animateHeight(content, true)
  }

  // Close specific item
  closeItem(index) {
    const trigger = this.triggerTargets[index]
    const content = this.contentTargets[index]
    const icon = this.hasIconTarget ? this.iconTargets[index] : null

    trigger.setAttribute("aria-expanded", "false")
    
    // Rotate icon back
    if (icon) {
      icon.style.transform = "rotate(0deg)"
    }

    // Smooth height animation
    this.animateHeight(content, false)
  }

  // Close all items
  closeAll() {
    this.triggerTargets.forEach((_, index) => {
      if (this.triggerTargets[index].getAttribute("aria-expanded") === "true") {
        this.closeItem(index)
      }
    })
  }

  // Animate height for smooth transitions
  animateHeight(element, expand) {
    if (expand) {
      // Expanding
      element.style.maxHeight = element.scrollHeight + "px"
    } else {
      // Collapsing
      element.style.maxHeight = element.scrollHeight + "px"
      // Force reflow
      element.offsetHeight
      element.style.maxHeight = "0"
      
      setTimeout(() => {
        element.classList.add("hidden")
        element.classList.remove("block")
      }, 300) // Match transition duration
    }
  }
}
