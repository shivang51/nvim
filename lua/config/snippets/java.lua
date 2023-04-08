local ls = require("luasnip")


-- some shorthands...
local snip = ls.snippet
local node = ls.snippet_node
local text = ls.text_node
local insert = ls.insert_node
local func = ls.function_node
local choice = ls.choice_node
local dynamicn = ls.dynamic_node

local function get_buf_name()
    local bufnr = vim.api.nvim_get_current_buf()
    -- return vim.api.nvim_buf_get_name(bufnr)
    return vim.fn.expand('%:t:r')
end

return {
    snip({trig="sout", namr="Sys Out", dscr="System.out.println(value);"},
        {
            text("System.out.println("), insert(1, "value"), text(");")
        }
    ),
    snip({
            trig="clm", namr="class with main function",
            dscr="public class $name{\n\tpublic static void main(String[] args){}\n}"
        },
        {
            text("public class "), func(get_buf_name, {}),
            text({"{", "\tpublic static void main(String[] args){", "\t\t"}),
            insert(1),
            text({"", "\t}", "}"}),
            insert(0)
        }
    ),
    snip({
            trig="cl", namr="class template",
            dscr="class $name{\n}"
        },
        {
            text("class "), insert(1, "name"), text({"{", "\t"}),
            insert(1),
            text({"", "}"}),
            insert(0)
        }
    ),
    snip({trig="scanner", namr="Scanner", dscr="Scanner sc = new Scanner(System.in);"},
        {
            text("Scanner sc = new Scanner(System.in);")
        }
    ),
}
