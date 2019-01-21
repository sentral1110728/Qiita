class CreateArticles < ActiveRecord::Migration[5.2]
  def change
    create_table :articles do |t|
      t.string   :title, null: false, index: true
      t.text     :text, null: false
      t.string   :image
      t.references :user, null: false, foreign_key: true
      t.timestamps null: true
    end
  end
end
