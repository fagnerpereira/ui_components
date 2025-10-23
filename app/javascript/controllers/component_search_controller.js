import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["searchInput", "searchContainer"]

  handleKeydown(event) {
    if (event.key === "Escape") {
      this.searchInputTarget.blur()
      this.clearSearch()
    }

    if (event.key === "Enter") {
      event.preventDefault()
    }
  }

  search(event) {
    const query = event.target.value.toLowerCase()
    this.filterComponents(query)
  }

  filterComponents(query) {
    const sections = document.querySelectorAll("section")
    let hasResults = false

    sections.forEach(section => {
      const cards = section.querySelectorAll("[data-controller='code_toggle']")
      let sectionHasResults = false

      cards.forEach(card => {
        const title = card.querySelector("h3")?.textContent.toLowerCase() || ""
        const matches = title.includes(query) || query === ""

        if (matches) {
          card.style.display = ""
          if (query !== "") sectionHasResults = true
          hasResults = true
        } else {
          card.style.display = "none"
        }
      })

      if (query === "") {
        section.style.display = ""
      } else {
        section.style.display = sectionHasResults ? "" : "none"
      }
    })
  }

  clearSearch() {
    this.searchInputTarget.value = ""
    this.filterComponents("")
  }
}
