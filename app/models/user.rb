class User < ActiveRecord::Base
  has_secure_password(validations: false)
  validates :username, presence: true,
                       uniqueness: true
  validates :email, presence: true,
                    uniqueness: true,
                    format: { with: /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i },
                    if: 'provider.blank?'
  validates :first_name, :last_name, presence: true, if: 'provider.blank?'
  validates :display_name, length: { in: 2..32 },
            allow_blank: true
  validates :password, presence: true, confirmation: true, if: 'provider.blank?'
  validates :password_confirmation, presence: true, if: 'provider.blank?'
  validates :phone, format: { with: /[0-9\-\+]{9,15}/, message: "Phone number invalid." },
                    allow_blank: true
  before_save :format_phone, unless: 'phone.blank?'
  enum role: %w(default admin)

  has_many :orders

  def full_name
    "#{first_name} #{last_name}"
  end

  def total_items_purchased
    orders.map(&:total_items).reduce(:+)
  end

  def format_phone
    self.phone = self.phone.gsub(/[^0-9]/, '')
  end

  def self.find_or_create_by_auth(auth_data)
    user = User.where(provider: auth_data['provider'], uid: auth_data['uid']).first_or_create
    if user.username != auth_data["info"]["nickname"]
      user.username = auth_data["info"]["nickname"]
      user.first_name = auth_data["info"]["name"]
      user.save
    end
    user
  end
end
