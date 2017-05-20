class Book < ApplicationRecord
  belongs_to :author
  belongs_to :theme
  belongs_to :editorial
  has_many :copies
  has_attached_file :avatar, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\z/

	def self.search(search)
		if search
			t = self.arel_table
			s = "%#{search}%"
			self.where(t[:title].matches(s))
		else
			self.all
		end
	end

	def loaned()
		r = 0
		self.copies.each do |copy|
			r += copy.loans.where(active: [1, 0]).count
		end
		r
	end
end
