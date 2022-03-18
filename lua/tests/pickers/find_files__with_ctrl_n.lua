local helper = require "telescope.testharness.helpers"
local runner = require "telescope.testharness.runner"

runner.picker("find_files", "fixtures/file<c-p>", {
  post_close = {
    { "lua/tests/fixtures/file_abc.txt", helper.get_selection_value },
  },
}, {
  scroll_strategy = "cycle",
})
