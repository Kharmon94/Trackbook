# frozen_string_literal: true

# Use this hook to configure Devise mailer, ORM, and other settings.
# You can copy & paste the generated file from `rails generate devise:install`

Devise.setup do |config|
  # ==> Mailer Configuration
  config.mailer_sender = "please-change-me-at-config-initializers-devise@example.com"

  # Configure the class responsible to send e-mails.
  # config.mailer = "Devise::Mailer"

  # Load and configure the ORM. Supports :active_record (default) and
  # :mongoid (bson_ext recommended) by default. Other ORMs may be
  # available as additional gems.
  require "devise/orm/active_record"

  # Case-insensitive keys (email usually stored in lowercase).
  config.case_insensitive_keys = [:email]

  # Strip whitespace from keys
  config.strip_whitespace_keys = [:email]

  # Skip storage for http authentication
  config.skip_session_storage = [:http_auth]

  # If true, stretches the password, default is 12 (bcrypt cost)
  config.stretches = Rails.env.test? ? 1 : 12

  # Re-confirmation required when changing email
  config.reconfirmable = true

  # Expire all remember me tokens on sign out
  config.expire_all_remember_me_on_sign_out = true

  # Range for password length
  config.password_length = 6..128

  # Time interval you can reset your password with a reset password key
  config.reset_password_within = 6.hours

  # Sign out via DELETE request. :get is not recommended.
  config.sign_out_via = :delete
end
