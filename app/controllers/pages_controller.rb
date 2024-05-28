# app/controllers/pages_controller.rb
class PagesController < ApplicationController
  before_action :authenticate_user!, only: [:home]

  def home
    # home action code
  end
end
