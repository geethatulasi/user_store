class Address < ApplicationRecord
  belongs_to :store

  def full_address
    self.street + ',' + self.city + ',' + self.state + ',' + self.country + ',' +self.zipcode
  end

end
