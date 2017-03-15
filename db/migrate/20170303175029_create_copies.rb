class CreateCopies < ActiveRecord::Migration[5.0]
  def change
    create_table :copies do |t|
      t.date :year
      t.string :location
      t.references :book, foreign_key: true

      t.timestamps
    end
  end
end
