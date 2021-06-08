class RoadmapsController < ApplicationController
	def suggested
		@topics = Topic.all
		@tracks = Track.all
		@topic_track = TopicTrack.all
	end
end
