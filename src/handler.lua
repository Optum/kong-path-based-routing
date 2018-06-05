local BasePlugin = require "kong.plugins.base_plugin"
local access = require "kong.plugins.kong-path-based-routing.access"
local PathBasedRoutingPluginHandler = BasePlugin:extend()
PathBasedRoutingPluginHandler.PRIORITY = 10

function PathBasedRoutingPluginHandler:new()
	PathBasedRoutingPluginHandler.super.new(self, "kong-path-based-routing")
end

function PathBasedRoutingPluginHandler:access(conf)
  PathBasedRoutingPluginHandler.super.access(self)
  access.execute(conf)
end

return PathBasedRoutingPluginHandler
