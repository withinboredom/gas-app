class @AutoObject extends Sourced.Resource
  constructor: (props = {}) ->
    @id = props.id
    @version = props.version
    @setDefaults()



  setDefaults: () ->
    @version = 0 unless @version?