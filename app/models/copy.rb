class Copy < ApplicationRecord
  belongs_to :book
  has_many :loans
  has_many :users, through: :loans

  def loansActive?
  	if self.loans.where(active: [1, 0]).size>0
  		true
  	else
  		false
  	end
  end
end
