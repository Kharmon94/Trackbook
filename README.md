# GitHub Codespaces ♥️ Ruby on Rails

Welcome to your shiny new Codespace running Rails! We've got everything fired up and running for you to explore Rails.

You've got a blank canvas to work on from a git perspective as well. There's a single initial commit with the what you're seeing right now - where you go from here is up to you!

Everything you do here is contained within this one codespace. There is no repository on GitHub yet. If and when you’re ready you can click "Publish Branch" and we’ll create your repository and push up your project. If you were just exploring then and have no further need for this code then you can simply delete your codespace and it's gone forever.

## Devise Authentication

This project has been prepared to use the [Devise](https://github.com/heartcombo/devise) gem for user authentication. To finish the setup:

1. Add the gem and install dependencies:
   ```sh
   # (already added to Gemfile)
   bundle install
   ```
2. Run the generators (you won't need to create the initializer or model yourself after running these):
   ```sh
   bin/rails generate devise:install
   bin/rails generate devise User
   ```
3. Apply the migration:
   ```sh
   bin/rails db:migrate
   ```
4. Start the server and visit `/users/sign_up` or `/users/sign_in`.

A simple integration test (`test/controllers/users_flow_test.rb`) exercises registration and sign‑out; run the full test suite with `bin/rails test` once the migration has been applied.

Feel free to expand on `User` with additional Devise modules or custom fields as needed.

## Database configuration

This application uses SQLite3 by default for development and test. Production is set up for PostgreSQL; the `pg` gem is included in the `:production` group and `config/database.yml` expects connection settings from environment variables (`DATABASE_NAME`, `DATABASE_USER`, `DATABASE_PASSWORD`, or a full `DATABASE_URL`).

You can run `bundle install` after adjusting your environment, and migrations will work normally against SQLite locally.

## Active Storage

Local disk storage is used in development and test (`config/storage.yml` contains a `local` service). In production the service is switched to `:amazon` and the `aws-sdk-s3` gem is included only in the production group. Configure the following environment variables before deploying:

- `AWS_ACCESS_KEY_ID`
- `AWS_SECRET_ACCESS_KEY`
- `AWS_REGION` (defaults to `us-east-1` if unset)
- `AWS_BUCKET`

You can alternatively store credentials using `bin/rails credentials:edit` and
reference them in `config/storage.yml` (the example configuration already
reads from `ENV` for convenience).

Uploads will then be stored in the specified S3 bucket. You may override the service at runtime with `ENV["ACTIVE_STORAGE_SERVICE"]` if you want to test alternatives.

## Authorization (CanCanCan)

This project uses [CanCanCan](https://github.com/CanCanCommunity/cancancan) for role-based access control (RBAC). The gem is included in the main `Gemfile`.

### Roles

The `User` model has an `admin` boolean column (added via migration `add_admin_to_users`). Call the `admin?` method to check if a user has administrative privileges.

### Default abilities

The `Ability` class (`app/models/ability.rb`) defines the following default permissions:

- **Admins** (`user.admin? == true`): can manage everything (`:manage, :all`).
- **Authenticated users**: can read most resources and update/read their own user profile.
- **Guests** (not logged in): can read public content.

### Usage in controllers

CanCanCan integrates with `ApplicationController` via the `include CanCan::ControllerAdditions` mixin. You can:

1. **Automatically load and authorize resources** (recommended):
   ```ruby
   class PostsController < ApplicationController
     load_and_authorize_resource
   end
   ```

2. **Manually authorize actions**:
   ```ruby
   authorize!(:read, @post)
   authorize!(:destroy, @post)
   ```

3. **Check abilities in views**:
   ```erb
   <% if can?(:edit, @post) %>
     <%= link_to "Edit", edit_post_path(@post) %>
   <% end %>
   ```

### Access denied handling

When a user tries to access a resource they don't have permission for, `CanCan::AccessDenied` is rescued in `ApplicationController` and the user is redirected to the root path with an alert message.

### Making a user an admin

Currently you can set a user to admin via the Rails console or a migration:

```ruby
# In rails console
user = User.find(1)
user.update(admin: true)
```

Expand the `Ability` class to add more nuanced rules as your application grows!

