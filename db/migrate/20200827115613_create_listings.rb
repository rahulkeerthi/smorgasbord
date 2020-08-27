class CreateListings < ActiveRecord::Migration[6.0]
  def change
    create_table :listings do |t|
      t.string :picture
      t.string :address
      t.string :location
      t.integer :home_type
      t.string :price

      t.timestamps
    end
  end
end
