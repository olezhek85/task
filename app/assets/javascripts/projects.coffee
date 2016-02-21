ready = ->
  $(".task-list tbody").sortable
    axis: "y"
    handle: ".sort"
    update: ->
      $.post($(this).data('update-url'), $(this).sortable('serialize'))

  $(".projects").sortable
    axis: "y"
    handle: ".project-header"
    update: ->
      $.post($(this).data('update-url'), $(this).sortable('serialize'))

$(document).ready(ready)
$(document).on('page:load', ready)
