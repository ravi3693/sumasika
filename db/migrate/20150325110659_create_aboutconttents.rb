class CreateAboutconttents < ActiveRecord::Migration
  def change
    create_table :aboutconttents do |t|
      t.string :content
      t.string :image_uid
      t.string :image_name
      t.string :titleone
      t.string :titletwo
      t.string :titlethree

      t.timestamps null: false
    end
  end
end
