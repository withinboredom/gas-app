describe 'Bored.Testing', ->
  describe 'Classes', ->
    class TestClass
      Dependencies:
        new Immutable.Map
          'first': 'first'
          'second': 'second'

    describe 'Depend on', ->
      it 'checks if a given class depends on stuff', ->
        expect(TestClass).to.dependOn new Immutable.Map {
          'first': 'first'
          'second': 'second'
        }
      it 'throws an error if it fails', ->
        fail = -> expect(TestClass).to.dependOn new Immutable.Map 'first': 'first'
        expect(fail).to.throw Error