class User < ActiveRecord::Base
  has_secure_password
  before_validation :format_phone
  validates :username, presence: true,
                       uniqueness: true
  validates :email, presence: true,
                    uniqueness: true,
                    format: { with: /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i }
  validates :first_name, :last_name, presence: true
  validates :display_name, length: { in: 2..32 },
            allow_blank: true

  validates :password, presence: true,
                       confirmation: true
  validates :password_confirmation, presence: true
  validates :phone, phony_plausible: true
  enum role: %w(default admin)

  has_many :orders

  def full_name
    "#{first_name} #{last_name}"
  end

  def total_items_purchased
    orders.map(&:total_items).reduce(:+)
  end

  def format_phone
    self.phone = '+1' + self.phone.gsub(/[^0-9]/, '')
  end
end
