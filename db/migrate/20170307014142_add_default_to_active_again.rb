class AddDefaultToActiveAgain < ActiveRecord::Migration[5.0]
  def change
  	change_column :loans, :active, :integer, :default => 0
  end
end
