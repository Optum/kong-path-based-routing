local _M = {}

function _M.execute(conf)
  local host = ""
  for i, key in ipairs(conf.host_fields) do
    ngx.log(ngx.ERR, "Found Key " .. key)
    ngx.log(ngx.ERR, "Request URI " .. ngx.var.request_uri)
    if string.find(key, "%$") then
      key = key:gsub('[%$]', '')
      ngx.log(ngx.ERR, "Key after stripping chars " .. key)
      key = ngx.var.request_uri:match(key):gsub("/%S+","")
    end
      ngx.log(ngx.ERR, "Final value " .. key)
    host = host .. key  
  end
  ngx.req.set_header("host", host)
  ngx.var.upstream_host = host
  ngx.ctx.balancer_address.host = host
end

return _M
