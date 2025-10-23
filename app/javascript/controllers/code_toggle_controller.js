import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["button", "codeBlock"]
  static values = {
    code: String
  }

  toggle(event) {
    event.preventDefault()
    const isVisible = this.codeBlockTarget.classList.contains("hidden")

    if (isVisible) {
      this.show()
    } else {
      this.hide()
    }
  }

  show() {
    this.codeBlockTarget.classList.remove("hidden", "opacity-0", "scale-y-95")
    this.codeBlockTarget.classList.add("opacity-100", "scale-y-100")
    this.buttonTarget.textContent = "Hide Code"
  }

  hide() {
    this.codeBlockTarget.classList.add("hidden", "opacity-0", "scale-y-95")
    this.codeBlockTarget.classList.remove("opacity-100", "scale-y-100")
    this.buttonTarget.textContent = "View Code"
  }

  copy(event) {
    event.preventDefault()
    const button = event.target
    const code = this.codeValue

    navigator.clipboard.writeText(code).then(() => {
      const originalText = button.textContent
      button.textContent = "Copied!"

      setTimeout(() => {
        button.textContent = originalText
      }, 2000)
    }).catch(err => {
      console.error("Failed to copy:", err)
      button.textContent = "Copy Failed"
      setTimeout(() => {
        button.textContent = originalText
      }, 2000)
    })
  }
}
