
# An aggregate object

class @EventUnkownException extends BaseObject
  constructor: ->
    super []
    @Set 'message', "This aggregate doesn't know how to apply this event"

class @Aggregate extends BaseObject
  Apply: []

  constructor: (id) ->
    super []
    @Set('id', id)
    @Set('EventsLoaded', 0)

  ApplyEvents: (events) ->
    if events?
      _.each events, (event) =>
        @ApplyOneEvent(event)

  ApplyOneEvent: (event) ->
    if @Apply[event.name]?
      @Apply[event.name] event
      @Set 'EventsLoaded', @Get('EventsLoaded') + 1
    else
      throw new EventUnkownException()