class CreateExperts < ActiveRecord::Migration
  def change
    create_table :experts do |t|
      t.string :name
      t.string :designation
      t.text :description
      t.string :image_uid
      t.string :image_name

      t.timestamps null: false
    end
  end
end
