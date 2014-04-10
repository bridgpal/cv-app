Router = Backbone.Router.extend
  routes:
    '':                 'showVitaes'
    'vitaes':           'showVitaes'
    'vitae/:id':        'showVitae'

  showVitaes: ->
    console.log 'test'
    # @showPage "/api/vitaes",
      # Handlebars.templates.vitaes

  showVitae: (id) ->
    alert 'inside here'
    console.log "tested"
    console.log "vitaes"
    console.log "show-vitaes"
    # @showPage "/api/vitaes/#{id}",
      # Handlebars.templates.vitae

  showPage: (url, tmplFunc) ->
    $.ajax url,
      type: 'GET'
      data: 'json'
      success: (data) ->
        $('#page-content').html(tmplFunc(data))
      error: (x,y,z) ->
        console.log x,y,z

$ ->
  router = new Router()
  router.on
  Backbone.history.start pushState: true, hashChange: false