-- luacheck: globals vim

local format = string.format
local buf = vim.buffer()
local ext = buf.name:match("%.%w+$"):sub(2):lower()
local dictionary = {
     sh = "bash",
      c = "c",
    css = "css",
   html = "html",
     js = "js",
   json = "json",
    lua = "lua",
     rb = "ruby"
}

ext = dictionary[ext] or "None"
os.execute(format("pastebinit -f %s -i %s | xclip -selection primary", ext, buf.fname))
print("OK")
