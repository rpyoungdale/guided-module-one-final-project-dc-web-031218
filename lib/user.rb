class User < ActiveRecord::Base
  has_many :rounds
  has_many :sports, through: :rounds
end
