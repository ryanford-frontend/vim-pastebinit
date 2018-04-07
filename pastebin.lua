-- luacheck: globals vim

local format = string.format
local name = vim.buffer().fname
local ext = (name:match("%.%w+$") or ".txt"):sub(2):lower()
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

ext = dictionary[ext] or "text"
local status, err = assert(os.execute(format("pastebinit -f %s -i %s | xclip -selection primary", ext, name)))
print(status == 0 and "OK" or err)
