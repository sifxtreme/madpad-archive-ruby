class Post < ActiveRecord::Base

	validates :url, presence: true

end