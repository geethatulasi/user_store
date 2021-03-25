class Phone < ApplicationRecord
  validates :number,presence: true,length:{:is=>10,message: "should be 10 integers"}
  # validates_format_of :number,with:/\Ad{10}\Z/
end
