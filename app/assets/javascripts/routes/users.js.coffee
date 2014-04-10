App.UsersRoute = Ember.Route.extend
  model: ->
    @store.find('user')

App.ApplicationAdapter = DS.RESTAdapter.extend
  namespace: 'api'

App.ApplicationAdapter.configure("plurals", user: 'users')



App.Store = DS.Store.extend
  revision: 13,
  adapter: App.ApplicationAdapter.create()