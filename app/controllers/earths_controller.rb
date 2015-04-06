class EarthsController < ApplicationController
  before_action :fetch_grams

  def fetch_grams
    @fetched_grams = Instagram.client.tag_recent_media("cat")
    @fetched_grams.each do |gram|
      if (!Earth.exists?(ig_id: gram.id)) && (gram.type == "image")
        new_earth = Earth.new
        new_earth.full_name = gram.user.full_name
        new_earth.username = gram.user.username
        new_earth.profile_picture = gram.user.profile_picture
        new_earth.text = gram.caption.text
        new_earth.filter = gram.filter
        new_earth.image = gram.images.standard_resolution.url
        new_earth.thumbnail = gram.images.thumbnail.url
        new_earth.link = gram.link
        new_earth.location = gram.location.name unless gram.location.nil?
        new_earth.latitude = gram.location.latitude unless gram.location.nil?
        new_earth.longitude = gram.location.longitude unless gram.location.nil?
        new_earth.ig_id = gram.id
        new_earth.ig_created_time = gram.created_time
        new_earth.save
        Earth.first.destroy if Earth.count > 250
      end
    end
  end

  def home
    @earthstagrams = Earth.fresh
    # @image_urls = @earthstagrams.map {|e| e.image}
  end

  def about
  end

end