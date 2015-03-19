
Sourced = Npm.require 'boco-sourced'

Future = Npm.require 'fibers/future'

sr = Sourced.Service.storeRevision
Sourced.Service.storeRevision = (revision) ->
  future = new Future()
  sr(revision, Meteor.bindEnvironment((error, result) ->
    if error?
      return future.error error

      future.return null
  ))

  future.wait()

h = Sourced.Service.hydrate
Sourced.Service.hydrate = (type, id) ->
  future = new Future()
  h(type, id, Meteor.bindEnvironment((error, result) ->
    if error?
      return future.error error

      future.return result
  ))

  future.wait()

@Sourced = Sourced