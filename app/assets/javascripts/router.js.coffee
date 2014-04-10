
Router = Backbone.Router.extend
  routes:
    'users':           'showUsers'
    'users/:id':        'showUser'

  showUsers: ->
    console.log 'test'
    @showPage "/api/users", HandlebarsTemplates['users/index']

  showUser: (id) ->
    console.log 'showUser'
    @showPage "/api/users/#{id}", HandlebarsTemplates['users/show']

  showPage: (url, tmplFunc) ->
    $.ajax url,
      type: 'GET'
      data: 'json'
      success: (data) ->
        console.log data
        $('body').html(tmplFunc(data))
      error: (x,y,z) ->
        console.log x,y,z

$ ->
  new Router()
  Backbone.history.start pushState: false