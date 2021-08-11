local ls = {}
ls = require("luasnip")

local s = ls.snippet
local sn = ls.snippet_node
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local c = ls.choice_node
local d = ls.dynamic_node

local str = function(text)
  return t { text }
end


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

local function char_count_same(c1, c2)
	local line = vim.api.nvim_get_current_line()
	local _, ct1 = string.gsub(line, c1, '')
	local _, ct2 = string.gsub(line, c2, '')
    print("c1",c2)
    print("c2",c1)
	return ct1 == ct2
end

local function even_count(c1)
	local line = vim.api.nvim_get_current_line()
	local _, ct = string.gsub(line, c1, '')
    print("line", line)
    print("ct",ct)
    print("even_count",ct % 2 == 0)
	return ct % 2 == 0
end

local function neg(fn, ...)
    print("neg call")
	return not fn(...)
end

ls.snippets = {
    all = {
		s({trig="("}, { t({"("}), i(1), t({")"}), i(0) }, neg, char_count_same, '%(', '%)'),
		s({trig="{"}, { t({"{"}), i(1), t({"}"}), i(0) }, neg, char_count_same, '%{', '%}'),
		s({trig="["}, { t({"["}), i(1), t({"]"}), i(0) }, neg, char_count_same, '%[', '%]') ,
		s({trig="<"}, { t({"<"}), i(1), t({">"}), i(0) }, neg, char_count_same, '<', '>'),
		s({trig="'"}, { t({"'"}), i(1), t({"'"}), i(0) }, neg, even_count, '\''),
		s({trig="\""}, { t({"\""}), i(1), t({"\""}), i(0) }, neg, even_count, '"'),
		s({trig="{;"}, { t({"{","\t"}), i(1), t({"", "}"}), i(0) }),
         s("trig", c(1, {
            t("Ugh boring, a text node"),
            i(nil, "At least I can edit something now..."),
            f(function(args) return "Still only counts as text!!" end, {})
         })),
         -- When wordTrig is set to false, snippets may also expand inside other words.
         -- It's possible to use capture-groups inside regex-triggers.
		s(
			{ trig = "b(%d)", regTrig = true },
			f(function(args)
				return "Captured Text: " .. args[1].captures[1] .. "."
			end, {})
		),
		ls.parser.parse_snippet(
			{ trig = "te", wordTrig = false },
			"${1:cond} ? ${2:true} : ${3:false}"
		),

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
        s("tT", t("t *testing.T")),
        s("main",{
            t ({ "func main() {", "\t" }),
            i(0),
            t { "", "}" },
        }),
        s("ef",{
            i(1, { "val" }),
            t(", err := "),
            i(2, { "f" }),
            t("("),
            i(3),
            t(")"),
            i(0),
        }),
        s("tpi",{
            t("// "),
            f(copy, 1),
            t {" interface","type "},
            i(1, { "name" }),
            t({" interface {","\t"}),
            i(0),
            t({"", "}"}),
        }),
        s("tpst",{
            t("// "),
            f(copy, 1),
            t{" struct","type "},
            i(1, { "name" }),
            t({" struct {","\t"}),
            i(0),
            t({"", "}"}),
        }),
        s("fnt",{
            t("// "),
            f(copy, 1),
            t({"","func Test"}),
            i(1, { "what" }),
            t({"(t *testing.T) {","\t"}),
            i(0),
            t({"", "}"}),
        }),
    }
}

vim.cmd [[
  imap <silent><expr> <c-k> luasnip#expand_or_jumpable() ? '<Plug>luasnip-expand-or-jump' : '<c-k>'
  inoremap <silent> <c-j> <cmd>lua require('luasnip').jump(-1)<CR>

  imap <silent><expr> <C-E> luasnip#choice_active() ? '<Plug>luasnip-next-choice' : '<C-E>'

  snoremap <silent> <c-k> <cmd>lua require('luasnip').jump(1)<CR>
  snoremap <silent> <c-j> <cmd>lua require('luasnip').jump(-1)<CR>
]]
