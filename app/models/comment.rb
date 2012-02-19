class Comment < ActiveRecord::Base
	validates :name, :presence => true
	validates :message, :presence => true
	belongs_to :post
end
