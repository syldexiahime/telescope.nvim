local tester = require "telescope.testharness"

describe("scroll_cycle", function()
  it("should be able to move selections", function()
    tester.run_file "find_files__with_ctrl_n"
  end)
end)
