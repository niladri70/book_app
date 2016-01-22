class Book < ActiveRecord::Base

	validates :name, :author, :price, presence: true 
end
