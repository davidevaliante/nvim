local function filter(arr, fn)
  if type(arr) ~= 'table' then
    return arr
  end

  local filtered = {}
  for k, v in pairs(arr) do
    if fn(v, k, arr) then
      table.insert(filtered, v)
    end
  end

  return filtered
end

local function filterReactDTS(value)
  return string.match(value.targetUri, 'd.ts') == nil
end

local function notifyGrappleToggle()
  require("grapple").toggle()
  print("toggled mark")
  vim.fn.timer_start(3000, function()
    print(" ")
  end)
end

return {
  notifiGrappleToggle = notifyGrappleToggle,
  filter = filter,
  filterReactDTS = filterReactDTS,
}
