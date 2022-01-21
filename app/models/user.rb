class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :email, uniqueness: true, presence: true
  validates :first_name, presence: true
  validates :last_name, presence: true

  def full_name
    [first_name, middle_name, last_name].map(&:presence).compact.join(' ')
  end

  def avatar_url
    '/icons/avatar.png'
  end
end
