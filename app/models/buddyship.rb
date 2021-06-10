class Buddyship < ApplicationRecord
  belongs_to :buddy_a, class_name: :User
  belongs_to :buddy_b, class_name: :User
end
