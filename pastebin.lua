-- luacheck: globals vim

local format = string.format
local name = vim.buffer().fname
local temp_name = os.tmpname()
local temp = io.open(temp_name, "w+")
local content
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
vim.command(":%y")
content = vim.eval("@\"")
temp:write(content)
temp:seek("set", 0)
temp:close()
local status, err = assert(os.execute(format("pastebinit -f %s -i %s | xclip -selection clipboard", ext, temp_name)))
assert(os.execute("rm "..temp_name) == 0)
print(status == 0 and "OK" or err)
