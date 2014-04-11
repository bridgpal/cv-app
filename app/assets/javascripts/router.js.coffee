Router = Backbone.Router.extend
  routes:
    'users':      'showUsers'
    'users/:id':  'showUser'

  showUsers: ->
    console.log "show Users"
    @showPage "./api/users", HandlebarsTemplates['users/index']

  showUser: (id) ->
    console.log "show User"
    @showPage "../api/users/#{id}", HandlebarsTemplates['users/show']

  showPage: (url, template) ->
    $.ajax url,
      type: 'GET'
      data: 'json'
      success: (data) ->
        console.log data
        $("#results").html(template(data))
      error: (x,y,z) ->
        console.log x,y,z


$ ->
  new Router()
  Backbone.history.start pushState: false