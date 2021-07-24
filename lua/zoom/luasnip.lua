local ls = require("luasnip")

local s = ls.snippet
local sn = ls.snippet_node
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local c = ls.choice_node
local d = ls.dynamic_node

ls.config.set_config({
    history = true,
	-- Update more often, :h events for more info.
	updateevents = "TextChanged,TextChangedI",
})

-- args is a table, where 1 is the text in Placeholder 1, 2 the text in
-- placeholder 2,...
local function copy(args)
	return args[1]
end

ls.snippets = {
    all = {
        s({
            trig = "tpst",
            namer = "type struct",
        }, {
            t("sss"),
        }),
         s("ttt1", c(1, {
            t("Ugh boring, a text node"),
            i(nil, "At least I can edit something now..."),
            f(function(args) return "Still only counts as text!!" end, {})
         })),
         -- trigger is fn.
		s("fn", {
			-- Simple static text.
			t("//Parameters: "),
			-- function, first parameter is the function, second the Placeholders
			-- whose text it gets as input.
			f(copy, 2),
			t({ "", "function " }),
			-- Placeholder/Insert.
			i(1),
			t("("),
			-- Placeholder with initial text.
			i(2, "int foo"),
			-- Linebreak
			t({ ") {", "\t" }),
			-- Last Placeholder, exit Point of the snippet. EVERY 'outer' SNIPPET NEEDS Placeholder 0.
			i(0),
			t({ "", "}" }),
		}),
    },
    go = {
        s("tT", t("t *testing.T"))
    }
}


