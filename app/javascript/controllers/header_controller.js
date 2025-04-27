import { Controller } from "@hotwired/stimulus";
import { enter, leave, toggle } from "el-transition";

export default class extends Controller {
  static targets = ["openUserMenu", "userMenu"];
  //this is the method called authomatically
  connect() {
    console.log("header controller connected");
    this.openUserMenuTarget.addEventListener("click", (e) => {
      // this.userMenuTarget.classList.toggle("hidden");
      this.toggle(this.userMenuTarget)
    });
    this.openUserMenuTarget.addEventListener("mouseenter", (e) => {
      this.open(this.userMenuTarget)
      e.target.style = "transform: scale(1.2);";
    });
    this.openUserMenuTarget.addEventListener("mouseleave", (e) => {
      e.target.style = "transform: scale(1);";
    });
  }

  open(element) {
    enter(element).then(() => {
      console.log("Enter transition complete");
    });
  }

  close(element) {
    leave(element).then(() => {
      element.destroy();
    });
  }

  toggle(element) {
    toggle(element);
  }
}
