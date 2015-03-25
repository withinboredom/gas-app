chai.use (chai, utils) ->
  chai.Assertion.addMethod 'extend', (baseclass) ->
    input = @_obj

    @assert(
      input.__super__.constructor == baseclass,
      "Expected #{input} to extend baseClass",
      "",
      baseclass,
      input.__super__.constructor
    )