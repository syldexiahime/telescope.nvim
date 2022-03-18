local tester = require "telescope.testharness"

--[[
Available functions are
- fixtures/file_a.txt
- fixtures/file_abc.txt
--]]

describe("scroll_cycle", function()
  it("should be able to cycle selections: cycle", function()
    tester.run_string [[
      runner.picker("find_files", "fixtures/file<c-p>", {
        post_close = {
          { "lua/tests/fixtures/file_abc.txt", helper.get_selection_value },
        },
      }, {
        sorting_strategy = "ascending",
        scroll_strategy = "cycle",
      })
    ]]
  end)

  for _, sorting in ipairs { "ascending", "descending" } do
    it("should be able to cycle selections: cycle <c-n> " .. sorting, function()
      tester.run_string([[
        runner.picker("find_files", "fixtures/file<c-n><c-n>", {
          post_typed = {
            { "lua/tests/fixtures/file_a.txt", helper.get_selection_value },
          },
        }, {
          sorting_strategy = "]] .. sorting .. [[",
          scroll_strategy = "cycle",
        })
      ]])
    end)

    it("should be able to cycle selections: cycle <c-p>" .. sorting, function()
      tester.run_string([[
        runner.picker("find_files", "fixtures/file<c-p><c-p>", {
          post_typed = {
            { "lua/tests/fixtures/file_a.txt", helper.get_selection_value },
          },
        }, {
          sorting_strategy = "]] .. sorting .. [[",
          scroll_strategy = "cycle",
        })
      ]])
    end)
  end

  it("should be able to cycle selections: limit", function()
    tester.run_string [[
      runner.picker("find_files", "fixtures/file<c-p>", {
        post_close = {
          { "lua/tests/fixtures/file_a.txt", helper.get_selection_value },
        },
      }, {
        sorting_strategy = "ascending",
        scroll_strategy = "limit",
      })
    ]]
  end)
end)
