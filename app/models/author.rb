class Author < ApplicationRecord
	has_many :books
	has_attached_file :avatar, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  	validates_attachment_content_type :avatar, :content_type => /\Aimage/
	validates_attachment_file_name :avatar, :matches => [/png\Z/, /jpe?g\Z/]

	def self.search(search)
		if search
			t = self.arel_table
			s = "%#{search}%"
			self.where(t[:name].matches(s))
		else
			self.all
		end
	end
end
