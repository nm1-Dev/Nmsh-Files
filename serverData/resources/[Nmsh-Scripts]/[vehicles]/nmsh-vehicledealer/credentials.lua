local fromhex = function(str)
  return (str:gsub(
      "..",
      function(cc)
          return string.char(tonumber(cc, 16))
      end
  )) or str
end
