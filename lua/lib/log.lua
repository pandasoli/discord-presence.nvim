logs = {}


function logs.error(msg)
  print(string.format('\033[31mERROR:\033[0m %s', msg))
end

function logs.warning(msg)
  print(string.format('\033[33mWARNING:\033[0m %s', msg))
end

function logs.success(msg)
  print(string.format('\033[32mSUCCESS:\033[0m %s', msg))
end

function logs.info(msg)
  print(string.format('\033[36mINFO:\033[0m %s', msg))
end


return logs
