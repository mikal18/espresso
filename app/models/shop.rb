class Shop < ApplicationRecord
  has_many :drinks, dependent: :destroy
  has_many :shop_comments, dependent: :destroy
  has_many :tags, dependent: :destroy
  has_many :categories, through: :tags
  validates :name, presence: true

end
