class BuddyRequest < ApplicationRecord
  belongs_to :requestor, class_name: :User
  belongs_to :receiver, class_name: :User
end
