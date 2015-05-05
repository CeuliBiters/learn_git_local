class CreateImages < ActiveRecord::Migration
  def change
    create_table :images do |t|
      t.string :title
      t.string :file
      t.string :thumb

      t.timestamps null: false
    end
  end
end