class Item < ActiveRecord::Base
  validates :name, presence: true,
                   uniqueness: true
  validates :description, presence: true
  validates :price, presence: true,
                    numericality: { greater_than: 0 }
  # validate :at_least_one_category

  has_many :item_categories, dependent: :destroy
  has_many :categories, through: :item_categories
  has_many :order_items
  has_many :orders, through: :order_items

  has_attached_file :image, default_url: 'missing_image.jpg'
  validates_attachment_content_type :image, content_type: ['image/jpg', 'image/jpeg', 'image/png']

  private

  def at_least_one_category
    errors.add(:base, 'must add at least one category') if self.categories.empty?
  end
end
