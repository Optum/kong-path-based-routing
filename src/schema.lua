local typedefs = require "kong.db.schema.typedefs"

return {
  name = "kong-path-based-routing",
  fields = {
    { protocols = typedefs.protocols_http },
    { config = {
        type = "record",
        fields = {
        { host_fields = {
            type = "array",
            required = true,
            elements = {
              type = "string",
        }, }, },
    }, }, },
  },
}
