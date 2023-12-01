class HomeController < ApplicationController
  def home
    render({ :template => "home/homepage" })
  end
end
