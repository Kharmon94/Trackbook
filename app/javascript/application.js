// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"
import "bootstrap"

// Re‑initialize components on turbo navigation (collapse, tooltips, etc.)
import * as bootstrap from "bootstrap"

document.addEventListener("turbo:load", () => {
  document.querySelectorAll("[data-bs-toggle]").forEach(el => {
    const name = el.getAttribute("data-bs-toggle");
    if (name === "collapse") {
      const target = document.querySelector(el.getAttribute("data-bs-target"));
      if (target) new bootstrap.Collapse(target, {toggle: false});
    }
  });
});
