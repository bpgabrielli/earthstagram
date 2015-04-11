class Earth < ActiveRecord::Base

  def self.fresh
    Earth.last(50).reverse
  end

end
