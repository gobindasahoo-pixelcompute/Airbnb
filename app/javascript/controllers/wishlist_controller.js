import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = [ "heart" ]
  connect() {
    console.log("wishlist controller is connected")
  }
  updateWishListStatus(){
    console.log(this.heartTarget.dataset.status)
    this.heartTarget.dataset.status = (this.heartTarget.dataset.status === "false" ? "true" : "false")
    this.heartTarget.classList.toggle("fill-red-500")
  }
}
