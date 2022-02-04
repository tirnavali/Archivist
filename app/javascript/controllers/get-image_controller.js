import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = [ "loadPicture" ]


  inf(event){
    event.preventDefault();
    console.log("Hello console");
    console.log(event.params)
  }

  convert(event) {
    event.preventDefault();
    event.target.textContext = "Hello get image controller"
  }
}
