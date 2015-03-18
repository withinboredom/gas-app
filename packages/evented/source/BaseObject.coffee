# A common base object

# A common base object
moduleKeywords = ['extended', 'included']

class @ClassModule
  @extend: (obj) ->
    for key, value of obj when key not in moduleKeywords
      @[key] = value

    obj.extended?.apply @
    @

  @implements: (obj) ->
    for key, value of obj when key not in moduleKeywords
      @::[key] = value

    obj.included?.apply @
    @

class @BaseObject extends ClassModule
  # Sets the initial object properties
  constructor: (props) ->
    props ?= []
    @Properties = props

  # Get a property value
  Get: (prop) ->
    return @Properties[prop]

  # Set a property value
  Set: (prop, value) ->
    @Properties[prop] = value
    return value