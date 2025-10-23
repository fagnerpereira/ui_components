import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["icon", "button"]

  connect() {
    this.loadPreference()
  }

  toggle(event) {
    event.preventDefault()
    const isDark = document.documentElement.classList.contains("dark")

    if (isDark) {
      this.setLight()
    } else {
      this.setDark()
    }
  }

  setDark() {
    document.documentElement.classList.add("dark")
    localStorage.setItem("theme", "dark")
    this.updateIcon("☀️")
  }

  setLight() {
    document.documentElement.classList.remove("dark")
    localStorage.setItem("theme", "light")
    this.updateIcon("🌙")
  }

  loadPreference() {
    const preference = localStorage.getItem("theme") || "light"

    if (preference === "dark") {
      this.setDark()
    } else {
      this.setLight()
    }
  }

  updateIcon(emoji) {
    if (this.hasIconTarget) {
      this.iconTarget.textContent = emoji
    }
  }
}
