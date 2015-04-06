class Earth < ActiveRecord::Base

  def self.fresh
    Earth.last(20).reverse
  end

end
