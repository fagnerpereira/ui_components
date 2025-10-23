import { Controller } from "@hotwired/stimulus"

// Modal controller - handles showing/hiding modal dialogs
// Connects to data-controller="modal"
export default class extends Controller {
  static targets = ["container", "backdrop"]
  static classes = ["hidden"]

  connect() {
    // Initially hide the modal
    this.close()
    
    // Bind escape key
    this.boundHandleKeydown = this.handleKeydown.bind(this)
    document.addEventListener("keydown", this.boundHandleKeydown)
  }

  disconnect() {
    document.removeEventListener("keydown", this.boundHandleKeydown)
    this.enableBodyScroll()
  }

  // Open modal
  open() {
    this.containerTarget.classList.remove(this.hiddenClass)
    if (this.hasBackdropTarget) {
      this.backdropTarget.classList.remove(this.hiddenClass)
    }
    this.disableBodyScroll()
    
    // Focus trap - focus first focusable element
    const focusable = this.containerTarget.querySelector('button, [href], input, select, textarea, [tabindex]:not([tabindex="-1"])')
    if (focusable) focusable.focus()
  }

  // Close modal
  close() {
    this.containerTarget.classList.add(this.hiddenClass)
    if (this.hasBackdropTarget) {
      this.backdropTarget.classList.add(this.hiddenClass)
    }
    this.enableBodyScroll()
  }

  // Close when clicking backdrop
  closeOnBackdrop(event) {
    if (event.target === event.currentTarget) {
      this.close()
    }
  }

  // Handle keyboard events
  handleKeydown(event) {
    const isHidden = this.containerTarget.classList.contains(this.hiddenClass)
    
    if (event.key === "Escape" && !isHidden) {
      this.close()
    }
    
    // Handle TAB and SHIFT+TAB for focus trapping (Wind UI spec)
    if ((event.key === "Tab" || event.key === "Tab") && !isHidden) {
      this.trapFocus(event)
    }
  }

  // Trap focus within modal (TAB and SHIFT+TAB)
  trapFocus(event) {
    const focusableElements = this.containerTarget.querySelectorAll(
      'button, [href], input, select, textarea, [tabindex]:not([tabindex="-1"])'
    )
    const firstElement = focusableElements[0]
    const lastElement = focusableElements[focusableElements.length - 1]

    if (event.shiftKey && document.activeElement === firstElement) {
      event.preventDefault()
      lastElement.focus()
    } else if (!event.shiftKey && document.activeElement === lastElement) {
      event.preventDefault()
      firstElement.focus()
    }
  }

  // Prevent body scroll when modal is open
  disableBodyScroll() {
    document.body.style.overflow = "hidden"
  }

  // Re-enable body scroll
  enableBodyScroll() {
    document.body.style.overflow = ""
  }
}
