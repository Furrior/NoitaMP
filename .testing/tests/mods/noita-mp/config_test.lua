dofile("mods/noita-mp/files/scripts/init/init_.lua")

local lu = require("luaunit")

TestConfig = {}

function TestConfig:setUp()
    print("\nsetUp")
end

function TestConfig:tearDown()
    print("tearDown\n")
end