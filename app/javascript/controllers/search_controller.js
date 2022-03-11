import { Controller } from "@hotwired/stimulus"


export default class extends Controller {
    initialize(){
        window.counter = 0
    }
   
  connect() {
    console.log("search connected.");
  }

  add(){
    console.log("add clicked.");
    const time = new Date().getTime();
    
    let id = $("select").first().attr("id")
    let name = $("select").first().attr("id")
    id = id.replace(/\d+/g, time)
    name = name.replace(/\d+/g, time)
    $("select").first().attr("id", id)
    $("select").first().attr("name", name)
    


    $("select").last().attr("id").rep
    $("fieldset input").first()

    
   
  }

  remove(){
      console.log("remove clicked.");
      $("#remove-field").closest(".field").remove()
  }
}
