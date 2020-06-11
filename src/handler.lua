local access = require "kong.plugins.kong-path-based-routing.access"

KongPathBasedRoutingHandler = {}

KongPathBasedRoutingHandler.PRIORITY = 10
KongPathBasedRoutingHandler.VERSION = "2.0.0"

function KongPathBasedRoutingHandler:access(conf)
  access.execute(conf)
end

return KongPathBasedRoutingHandler
