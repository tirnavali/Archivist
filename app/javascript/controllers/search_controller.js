import { Controller } from "@hotwired/stimulus"


export default class extends Controller {
   
  connect() {
    var search_form = $("fieldset");
    var search_field = $("fieldset .field").eq(0)
    var new_search_field = search_field.clone()
    //First search form is saved for init again after remove all fields
    search_form.data("init_form", new_search_field);
    
  }
  initialize(){

  }

  add(){
    const time = new Date().getTime();
    var search_form = $("fieldset");
    var search_field = $("fieldset .field").eq(0)
    if(search_field.length == 0) {
      console.log("null")
      search_field = search_form.data("init_form")}
    var new_search_field = search_field.clone()

    new_search_field.children().map(function(){
      return $(this).prop("name", $(this).prop("name").replace(/\d+/g, time))
      .attr("id", $(this).attr("id").replace(/\d+/g, time))
      ;
    })

    search_form.append(new_search_field)  
  }

  remove(e){
    $(e.target).parent().remove();   
  }
}
