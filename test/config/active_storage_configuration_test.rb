require "test_helper"

class ActiveStorageConfigurationTest < ActiveSupport::TestCase
  test "development and test use local service" do
    assert_equal :local, Rails.application.config.active_storage.service
  end

  test "production environment defaults to amazon service" do
    # temporarily stub env to production to avoid loading the real configuration
    previous_env = Rails.env
    begin
      Rails.env = ActiveSupport::StringInquirer.new("production")
      Rails.application.reload_routes! if Rails.application.respond_to?(:reload_routes!)
      assert_equal :amazon, Rails.application.config.active_storage.service
    ensure
      Rails.env = ActiveSupport::StringInquirer.new(previous_env)
    end
  end
end
