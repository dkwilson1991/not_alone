import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="sortable-roles"
export default class extends Controller {
  static targets = ["group"]

  connect() {

  var token = document.getElementsByName('csrf-token')[0].content

  //   console.log(this.groupTargets)

  // const groups = this.groupTargets.map( groupTarget => groupTarget.id)
  // console.log(groups)
  this.groupTargets.forEach( htmlEl => {
    new Sortable(htmlEl, {
      group: 'shared', // set both lists to same group
      animation: 150,
      onSort: function(evt) {
        console.log(evt.item.dataset.assignmentId, evt.to.dataset.roleName) // most likely why this event is used is to get the dragging element's current index
        // same properties as onEnd
        const assignmentId = evt.item.dataset.assignmentId;
        fetch(`/assignments/${assignmentId}`, {
          headers: {
            'Content-type': 'application/json',
            "X-CSRF-Token": token
          }, method: "PATCH", body: JSON.stringify({assignment: {role: evt.to.dataset.roleName}})})//.then(response => response.json()).then(data => {
          // console.log(data)
        // })
      }
    });
  } )
  }
}
