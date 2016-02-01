class Link < ActiveRecord::Base
	validates :title, presence: true
	validates :url_address, presence: true
	
	belongs_to :user
end
