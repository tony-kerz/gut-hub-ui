angular.module('gutHub.session')

.factory 'session',
  ($location, $http, $q, env) ->
    apiUrlRoot = env.apiUrlRoot

    state = {}

    state: state

    login: (email, password) ->
      $http.post("#{apiUrlRoot}/login",
        user:
          email: email
          password: password
      ).then (resolution) ->
        console.log "session.login: resolution=%o", resolution
        state.currentUser = resolution.data.user

    logout: ->
      $http.post("#{apiUrlRoot}/logout").then (resolution) ->
        console.log "session.logout: resolution=%o", resolution
        state.currentUser = null

    currentUserId: ->
      state.currentUser?.email

###
    isAuthenticated: ->
      @state.currentUser

    register: (email, password, confirm_password) ->
      $http.post("#{apiUrlRoot}/users.json",
        user:
          email: email
          password: password
          password_confirmation: confirm_password
      )
      .then (resolution) ->
          state.currentUser = resolution.data

      requestCurrentUser: ->
        if @isAuthenticated()
          $q.when @currentUser
        else
          $http.get("#{apiUrlRoot}/current_user")
          .then (resolution) ->
              @currentUser = resolution.data.user
###