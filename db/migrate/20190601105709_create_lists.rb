class CreateLists < ActiveRecord::Migration[5.2]
  def change
    create_table :lists do |t|
      t.string :title
      t.string :content
      t.references :bucket, foreign_key: true

      t.timestamps
    end
  end
end
