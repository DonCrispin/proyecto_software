class AddUserReturnedToLoan < ActiveRecord::Migration[5.0]
  def change
  	add_column :loans, :user_return, :date

  end
end
