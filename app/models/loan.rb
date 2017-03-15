class Loan < ApplicationRecord
  belongs_to :copy
  belongs_to :user
end
