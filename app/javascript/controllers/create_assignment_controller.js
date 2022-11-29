import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="create-assignment"
export default class extends Controller {
  // static values = { chatroomId: Number }
  static targets = ["create", "form", "editForm"]
  connect() {
    console.log(`this should connect`)
    console.log(this.formTarget)
  }

  show()
  {
    this.formTarget.classList.toggle("d-none")
    console.log(this.formTarget.classList)
    if (this.formTarget.classList.contains("d-none")) {
      this.createTarget.innerText = "Create Camp"
    } else {
      this.createTarget.innerText = "Close"
    }
  }

  edit()
  {
    this.editFormTarget.classList.toggle("d-none")
    console.log(this.editFormTarget.classList)
  }
}
