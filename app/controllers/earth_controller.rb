class EarthController < ApplicationController
  def home
    render text: "<h1>Hello</h1><p>Welcome home</p>"
  end

  def about
  end
end