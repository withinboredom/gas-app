class @MemoryDispatcher extends BaseObject
  constructor: (store) ->
    super []
    @Set 'Store', store
    @Set 'Handlers', {}
    @Set 'Subscribers', {}

  SendCommand: (command) ->
    handlers = @Get 'Handlers'
    if handlers[command?.name]? then handlers[command.name] command else throw "Unable to find handler"

    @

  PublishEvent: (event) ->
    