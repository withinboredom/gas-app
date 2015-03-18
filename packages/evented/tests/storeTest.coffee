describe 'Storeage Tests', ->
  describe 'MemoryStorage', ->
    it 'can be created', ->
      s = new MemoryStore()
      s.SaveEventsFor 123, 0, [1,2,3]
    it 'can save and load events', ->
      s = new MemoryStore()
      events = [1,2,3]
      s.SaveEventsFor 123, 0, events
      m = s.LoadEventsFor 123
      expect(m).to.eql events
    it 'can append events', ->
      s = new MemoryStore()
      s.SaveEventsFor 123, 0, [1,2,3]
      m = s.LoadEventsFor 123
      expect(m).to.eql [1,2,3]
      s.SaveEventsFor 123, 3, [4]
      m = s.LoadEventsFor 123
      expect(m).to.eql [1,2,3,4]