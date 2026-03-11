require "test_helper"

class TrackTest < ActiveSupport::TestCase
  test "valid fixture" do
    assert tracks(:one).valid?
  end

  test "title is required" do
    track = tracks(:one)
    track.title = ""
    assert_not track.valid?
    assert_includes track.errors[:title], "can't be blank"
  end

  test "track_number uniqueness within project" do
    t1 = tracks(:one)
    t2 = tracks(:two)
    t2.project = t1.project
    t2.track_number = t1.track_number
    assert_not t2.valid?
    assert_includes t2.errors[:track_number], "has already been taken"
  end
end
