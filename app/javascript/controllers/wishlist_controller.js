import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = [ "heart" ]
  connect() {
    console.log("wishlist controller is connected")
  }
  updateWishListStatus(){
    const isUserLoggedIn = this.heartTarget.dataset.userLoggedIn;
    if(isUserLoggedIn === "false"){
      document.querySelector(".js-login").click();
      return;
    }
    console.log(this.heartTarget.dataset.status)
    this.heartTarget.dataset.status = (this.heartTarget.dataset.status === "false" ? "true" : "false")
    this.heartTarget.classList.toggle("fill-red-500")
  }
}
