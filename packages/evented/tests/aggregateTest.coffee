describe "Aggregate", ->
  describe 'bullshit', ->
    it 'does not die', ->
      expect(true).to.equal true
  describe 'able to create', ->
    it 'can be created', ->
      Agg = new Aggregate 1
      Agg.Set 'test', 'value'
      expect(Agg.Get('test')).to.equal 'value'
    it 'can not handle this event', ->
      Agg = new Aggregate 1
      expect(=> Agg.ApplyOneEvent name: 'broken').to.throw EventUnkownException