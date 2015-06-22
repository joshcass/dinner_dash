class Item < ActiveRecord::Base
  validates :name, presence: true,
            uniqueness: true
  validates :description, presence: true
  validates :price, presence: true,
            numericality: { greater_than: 0 }
  validate :at_least_one_category

  has_many :item_categories, dependent: :destroy
  has_many :categories, through: :item_categories
  has_many :order_items
  has_many :orders, through: :order_items

  has_attached_file :image, default_url: 'missing_image.jpg'
  validates_attachment_content_type :image, content_type: ['image/jpg', 'image/jpeg', 'image/png']

  enum status: %w(active retired)

  def self.new_and_add_categories(params)
    category_ids= params.delete(:category_ids)
    item = self.new(params)

    if category_ids
      category_ids.each do |category_id|
        item.categories << Category.find(category_id)
      end
    end
    item
  end

  def update_categories(category_ids)
    category_ids.each do |category_id|
      item_categories.find_or_create_by(category_id: category_id)
    end
  end


  def has_category?(category_id)
    categories.find_by_id(category_id)
  end

  private

  def at_least_one_category
    errors.add(:base, 'Item must have at least one category') if self.categories.empty?
  end
end
