class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :buddyships, ->(user) { where("buddy_a_id = ? OR buddy_b_id = ?", user.id, user.id) }
  has_many :buddys, through: :buddyships
end
