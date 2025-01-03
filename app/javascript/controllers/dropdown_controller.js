import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
    static targets = ["menu"]

    connect() {
        console.log("Dropdown")
    }
    toggle(event){
        event.preventDefault()
        this.menuTarget.classList.toggle("hidden")
    }
    hide(event){
        if (this.element.contains(event.target) == false){
            this.menuTarget.classList.add("hidden")
        }
    }
}
