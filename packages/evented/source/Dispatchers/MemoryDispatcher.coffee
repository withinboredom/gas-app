class @MemoryDispatcher extends BaseObject
  constructor: (store) ->
    super []
    @Set 'Store', store
    @Set 'Handlers', {}
    @Set 'Subscribers', {}

  SendCommand: (command) ->
    handlers = @Get 'Handlers'
    if handlers[command?.type]? then handlers[command.type] command else throw "Unable to find handler"

    @

  PublishEvent: (event) ->
    subscribers = @Get 'Subscribers'
    if subscribers[event?.type]?
      _.each subscribers[event.type], (caller) ->
        caller event