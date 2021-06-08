class TopicTrack < ApplicationRecord
	has_one :track
	has_many :topics
end
