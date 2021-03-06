angular.module('gutHub.session')

.factory 'session',
  ($location, $http, $q, env) ->
    apiUrlRoot = env.apiUrlRoot

    state = {}

    service =
      state: state

      login: (email, password) ->
        $http.post("#{apiUrlRoot}/sessions",
          user:
            email: email
            password: password
        ).then (resolution) ->
          console.log "session.login: resolution=%o", resolution
          state.currentUser = resolution.data.user

      logout: ->
        $http.delete("#{apiUrlRoot}/sessions").then (resolution) ->
          console.log "session.logout: resolution=%o", resolution
          state.currentUser = null

      currentUser: ->
        state.currentUser

      currentUserId: ->
        service.currentUser()?.email

      checkCurrentUser: ->
        $http.get("#{apiUrlRoot}/sessions/current").then (resolution)->
          console.log "session.check-current-user: resolution=%o", resolution
          state.currentUser = resolution.data.user

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
