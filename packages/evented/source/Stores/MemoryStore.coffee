class Stream
  constructor: (@Events) ->

class @MemoryStore extends BaseObject
  constructor: (Store) ->
    super []
    Store ?= {}
    @Set 'Store', Store

  LoadEventsFor: (id) ->
    s = @Get 'Store'
    s[id] ?= new Stream []
    s[id].Events

  SaveEventsFor: (id, version, newEvents) ->
    store = @Get 'Store'
    store[id] ?= new Stream []
    s = store[id]

    eventList = s.Events
    prevEvents = if eventList? then eventList.length else 0
    if prevEvents != version
      throw "Concurrency conflict"

    newEventList = eventList.concat newEvents
    store[id].Events = newEventList