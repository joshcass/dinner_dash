class Item < ActiveRecord::Base
  validates :name, presence: true,
                   uniqueness: true
  validates :description, presence: true
  validates :price, presence: true,
                    numericality: { greater_than: 0 }
  # validate :at_least_one_category

  has_many :item_categories
  has_many :categories, through: :item_categories
  has_many :order_items
  has_many :orders, through: :order_items

  private

  def at_least_one_category
    errors.add(:base, 'must add at least one category') if self.categories.empty?
  end
end
