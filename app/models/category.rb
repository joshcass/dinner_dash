class Category < ActiveRecord::Base
  validates :name, presence: true
  has_many :item_categories, dependent: :destroy
  has_many :items, through: :item_categories
end
