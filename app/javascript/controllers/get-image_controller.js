import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = [ "loadPicture" ]


  inf(event){
    let stage = $("#stage")[0];
    event.preventDefault();
    //console.log("Hello console");
    console.log(event.params.file);
    console.log(stage);
    $("#stage")[0].src=event.params.file
  }

  convert(event) {
    event.preventDefault();
    event.target.textContext = "Hello get image controller"
  }
}
