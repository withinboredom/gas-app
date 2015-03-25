chai.use (chai, utils) ->
  chai.Assertion.addMethod 'dependOn', (dependencies) ->
    input = this._obj

    this.assert(
      utils.type(input.prototype.Dependencies) == 'object',
      "expected #{input} to declare dependencies",
      "",
      dependencies,
      input.prototype.Dependencies
    )

    expected = JSON.stringify dependencies.toJS()
    actual = JSON.stringify input.prototype.Dependencies.toJS()

    this.assert(
      utils.eql(input.prototype.Dependencies, dependencies),
      "expected #{input} to depend on:\n#{expected}\nbut was:\n#{actual}",
      "",
      dependencies,
      input.prototype.Dependencies
    )