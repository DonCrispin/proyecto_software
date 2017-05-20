class AddLendedToCopy < ActiveRecord::Migration[5.0]
  def change
  	add_column :copies, :lended, :boolean, default: false
  end
end
