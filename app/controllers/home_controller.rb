class HomeController < ApplicationController
  def index
    @home_page = Page::Home.new(user: current_user)
  end
end
