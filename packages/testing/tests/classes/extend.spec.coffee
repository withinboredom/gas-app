describe 'Bored.Testing', ->
  describe 'Classes', ->
    class BaseClass
    class TestClass extends BaseClass

    describe '#extend', ->
      it 'checks if a given coffeescript class extends another', ->
        expect(TestClass).to.extend BaseClass

      it 'throws an error if it isnot', ->
        fail = ->
          expect(BaseClass).to.extend TestClass
        expect(fail).to.throw Error