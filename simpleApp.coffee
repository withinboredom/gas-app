class SimpleApp extends Space.Application
  RequiredModules: ['Space.cqrs']

  Dependencies:
    commandBus: 'Space.messaging.CommandBus'
    eventBus: 'Space.messaging.EventBus'
    configuration: 'Space.cqrs.configuration'
    Mongo: 'Mongo'

  configure: ->
    super

  run: ->
    super

  sendCommand: -> @commandBus.send.apply @commandBus, arguments

  subscribeTo: -> @eventBus.subscribeTo.apply @eventBus, arguments


class SimpleApp.PushCommand extends Space.messaging.Command
  @type 'SimpleApp.PushCommand'
  constructor: (data) ->
    {@pushed} = data

class SimpleApp.PushedEvent extends Space.messaging.Event
  @type 'SimpleApp.PushedEvent'
  @fields:
    SourceId: String
    version: Match.Optional(Match.Integer)
    Count: Match.Integer

class SimpleApp.PushButton extends Space.cqrs.Aggregate
  _numberPushes: null

  initialize: (id, data) ->
    @record new SimpleApp.PushedEvent
      SourceId: id
      Count: 0

  @handle SimpleApp.PushedEvent, (event) ->
    @_numberPushes = event.Count

class SimpleAppRouter extends Space.messaging.Controller
  @toString: -> 'SimpleAppRouter'

  Dependencies:
    repository: 'Space.cqrs.Repository'
    buttons: 'PushButtons'

  @handle SimpleApp.PushedEvent, on: (event) ->
    