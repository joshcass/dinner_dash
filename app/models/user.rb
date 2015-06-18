class User < ActiveRecord::Base
  has_secure_password
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
  enum role: %w(default admin)

  has_many :orders
end
