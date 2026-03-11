class HelloController < ApplicationController
  # demonstrate authorization on a controller without a model
  load_and_authorize_resource class: false

  # you may also require authentication before certain actions:
  # before_action :authenticate_user!, only: [:index]

  def index
  end
end
