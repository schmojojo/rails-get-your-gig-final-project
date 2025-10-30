// controllers/gigs_controller.js
import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  connect() {
    this.checkboxes = this.element.querySelectorAll(".filter-checkbox")
    this.checkboxes.forEach(cb =>
      cb.addEventListener("change", () => this.updateGigs())
    )
  }

  updateGigs() {
    const selectedCategories = Array.from(this.checkboxes)
      .filter(cb => cb.checked)
      .map(cb => cb.value)

    const query = new URLSearchParams(window.location.search).get("query") || ""

    // Build the URL for Turbo
    const params = new URLSearchParams()
    if (query) params.set("query", query)
    selectedCategories.forEach(cat => params.append("categories[]", cat))

    const url = `/gigs?${params.toString()}`
    // Turbo visit targets only the gigs-list frame
    Turbo.visit(url, { frame: "gigs-list" })
  }
}
