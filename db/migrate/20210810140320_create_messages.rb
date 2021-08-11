class CreateMessages < ActiveRecord::Migration[6.1]
  def change
    create_table :messages do |t|
      t.string :title
      t.string :description
      t.string :tag
      t.string :video
      t.string :thumb
      t.references :speaker, null: false, foreign_key: true

      t.timestamps
    end
  end
end
