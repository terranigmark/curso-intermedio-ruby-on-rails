window.PLATZI =
  init: ->
    console.log 'make with love by Platzi'
    PLATZI.misc.selectizeByScope('body')
    return
  tasks:
    index:
      setup: ->
        console.log 'in the index page'
        return
    form:
      setup: ->
        $('.participants').on 'cocoon:before-insert', (e, insertedItem, originalEvent) ->
          PLATZI.misc.selectizeByScope insertedItem
        return
  misc:
    selectizeByScope: (selector) ->
      $(selector).find('.selectize').each (i, el) ->
        $(el).selectize()
      return
$(document).on 'turbolinks:load', ->
  PLATZI.init()
