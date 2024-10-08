import {Controller} from "@hotwired/stimulus"
import Sortable from "sortablejs"

export default class extends Controller {
    connect() {
        this.sortable = new Sortable(this.element, {
            animation: 150,
            onEnd: this.end.bind(this)
        })
    }
    end(event) {
        let id = event.item.dataset.id
        let data = new FormData()
        data.append("position", event.newIndex + 1)

        fetch(`/tasks/${id}`, {
            method: "PATCH",
            headers: {
                "X-CSRF-Token": document.querySelector("[name='csrf-token']").content

            },
            body: data
        })
    }
}