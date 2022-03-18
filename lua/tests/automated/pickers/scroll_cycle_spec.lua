local tester = require "telescope.testharness"

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
