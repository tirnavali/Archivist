import "jquery";
import "select2";

import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  connect() {  
    // this code written because of browser back|forward actions   
    $(document).on("turbo:before-cache", function(){ 
      $('#multiple-organizations').select2('destroy');
    });
  
    $(document).ready(function(){
      $('#multiple-organizations').select2({
        //width: 500,
        placeholder: "Kurum seçiniz",
        allowClear: true,
        minimumResultsForSearch: 20,
        minimumInputLength: 3,
        ajax: {
          url: "http://localhost:3000/organizations.json",
          dataType: "json",       
          delay: 250,
          crossDomain: true,
          type: 'GET',
          data: function (params) {
            var q = {
              term:{name_cont: params.term},
              //commit:"Ara"
            }
            // Query parameters will be ?search=[term]&page=[page]
            //  organizations.json?term[name_cont]=some&[page]=2
            // /organizations.json?term[name_cont]
            return q;
          },
          processResults: function (response) {
            //console.log(response);
            // Transforms the top-level key of the response object from 'items' to 'results'
            return { results: response};
          },
          cache: true,
        },
      });
    })
  }
}
