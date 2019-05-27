class CreateBuckets < ActiveRecord::Migration[5.2]
  def change
    create_table :buckets do |t|
      t.string :title
      t.string :author
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
