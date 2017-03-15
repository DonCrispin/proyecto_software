class ChangeActiveToInt < ActiveRecord::Migration[5.0]
  def up
  	change_column :loans, :active, :integer, :using => 'case when active then 1 else 2 end'
  end
  def down
  	change_column :loans, :active, :boolean
  end
end
