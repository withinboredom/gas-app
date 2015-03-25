###
config = {}
config.storage = new Sourced.MemoryStorage()

sourced = Sourced.createService config

revision = sourced.createRevision 'Test', 'TestObject'
event = sourced.createEvent 'ButtonPush',
  pushed: '1'

revision.addEvent event

schema = sourced.createSchema 'TestObject'

class Butt extends Sourced */
###