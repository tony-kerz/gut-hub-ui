angular.module('gut-hub.recipe')

.factory 'httpRecipeService', ($http, env) ->

  #baseUrl = '/gut-hub-ui/build/src/app/recipes'
  baseUrl = "#{env.apiUrlRoot}/recipes"

  index: ->
    $http.get("#{baseUrl}.json")
    #$http.get("#{baseUrl}/recipes.index.json")
    .then (successResult)->
      console.log "http-recipe-service.index: success-result=%o", successResult
      successResult.data

  get: (id) ->
    $http.get("#{baseUrl}/#{id}.json")
    #$http.get("#{baseUrl}/recipes.get.json")
    .then (res)->
      console.log "http-recipe-service.get: res=%o", res
      res.data




