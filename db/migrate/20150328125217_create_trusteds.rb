class CreateTrusteds < ActiveRecord::Migration
  def change
    create_table :trusteds do |t|
      t.string :name
      t.string :company
      t.text :description
      t.integer :rating

      t.timestamps null: false
    end
  end
end
