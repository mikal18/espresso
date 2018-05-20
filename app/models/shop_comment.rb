class ShopComment < ApplicationRecord
  belongs_to :shop
  validates :heading, presence: true
end
