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
  require('fidget').notify("toggled mark for this buffer", nil, {
    annote = "Grapple"
  })
end

local function jumpToGrappleIndex(index)
  require('grapple').select({ index = index })
end


return {
  jumpToGrappleIndex = jumpToGrappleIndex,
  notifiGrappleToggle = notifyGrappleToggle,
  filter = filter,
  filterReactDTS = filterReactDTS,
}
