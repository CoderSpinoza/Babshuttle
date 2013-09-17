class Item < ActiveRecord::Base

	validates :name, presence: true
	has_attached_file :picture, styles: { :small => "60x60>", :large => "150x150>" }
end
