require "application_system_test_case"

class TracksTest < ApplicationSystemTestCase
  setup do
    @track = tracks(:one)
  end

  test "visiting the index" do
    visit tracks_url
    assert_selector "h1", text: "Tracks"
  end

  test "should create track" do
    visit tracks_url
    click_on "New track"

    fill_in "Director", with: @track.director
    fill_in "Featured artists", with: @track.featured_artists
    fill_in "Hook chorus bridge", with: @track.hook_chorus_bridge
    fill_in "Main artist", with: @track.main_artist
    fill_in "Main concept", with: @track.main_concept
    fill_in "Marketing plan", with: @track.marketing_plan
    fill_in "Producers", with: @track.producers
    fill_in "Project", with: @track.project_id
    fill_in "Title", with: @track.title
    fill_in "Track number", with: @track.track_number
    fill_in "Verses", with: @track.verses
    fill_in "Video concept", with: @track.video_concept
    fill_in "Videographer", with: @track.videographer
    click_on "Create Track"

    assert_text "Track was successfully created"
    click_on "Back"
  end

  test "should update Track" do
    visit track_url(@track)
    click_on "Edit this track", match: :first

    fill_in "Director", with: @track.director
    fill_in "Featured artists", with: @track.featured_artists
    fill_in "Hook chorus bridge", with: @track.hook_chorus_bridge
    fill_in "Main artist", with: @track.main_artist
    fill_in "Main concept", with: @track.main_concept
    fill_in "Marketing plan", with: @track.marketing_plan
    fill_in "Producers", with: @track.producers
    fill_in "Project", with: @track.project_id
    fill_in "Title", with: @track.title
    fill_in "Track number", with: @track.track_number
    fill_in "Verses", with: @track.verses
    fill_in "Video concept", with: @track.video_concept
    fill_in "Videographer", with: @track.videographer
    click_on "Update Track"

    assert_text "Track was successfully updated"
    click_on "Back"
  end

  test "should destroy Track" do
    visit track_url(@track)
    click_on "Destroy this track", match: :first

    assert_text "Track was successfully destroyed"
  end
end
