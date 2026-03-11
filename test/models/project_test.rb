require "test_helper"

class ProjectTest < ActiveSupport::TestCase
  test "valid fixture" do
    assert projects(:one).valid?
  end

  test "name is required" do
    project = projects(:one)
    project.name = ""
    assert_not project.valid?
    assert_includes project.errors[:name], "can't be blank"
  end
end
