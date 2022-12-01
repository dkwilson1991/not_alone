import { Controller } from "@hotwired/stimulus";

// Connects to data-controller="create-assignment"
export default class extends Controller {
  // static values = { chatroomId: Number }
  static targets = ["create", "form", "editForm"];
  connect() {
    console.log(`this should connect`);
    console.log(this.formTarget);
  }

  show() {
    this.formTarget.classList.toggle("d-none");
    console.log(this.formTarget.classList);
    if (this.formTarget.classList.contains("d-none")) {
      this.createTarget.innerText = "Create Camp";
    } else {
      this.createTarget.innerText = "Close";
    }
  }

  edit() {
    this.editFormTarget.classList.toggle("d-none");
    console.log(this.editFormTarget.classList);
  }

  async submitForm(event) {
    event.preventDefault();

    console.log("submit form");

    const response = await fetch(event.target.action, {
      method: "POST",
      headers: {
        Accept: "application/json",
      },
      body: new FormData(event.target),
    });

    console.log(response);

    if (response.ok) {
      console.log("Camp submitted successfully");
      Toastify({
        text: "Camp submitted successfully",
        duration: 3000,
        destination: "https://github.com/apvarun/toastify-js",
        newWindow: true,
        close: true,
        gravity: "top", // `top` or `bottom`
        position: "left", // `left`, `center` or `right`
        stopOnFocus: true, // Prevents dismissing of toast on hover
        style: {
          background: "linear-gradient(to right, #00b09b, #96c93d)",
        },
      }).showToast();
    }

    const data = await response.json();
    window.location.href = `/camps/${data.id}`;
  }
}
