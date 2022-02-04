import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
    connect(){
        console.log("Scene connected");
        //this.element.children[0].src= "http://placehold.jp/100x100.png";       
        
    }

    loadPicture(url){
        this.element.children[0].src= "http://placehold.jp/100x100.png";  
    }

}
