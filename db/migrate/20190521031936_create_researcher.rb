class CreateResearcher < ActiveRecord::Migration[5.2]
  def change
    create_table :researchers do |t|
      t.string :name
      t.string :genre
      t.string :image
      t.belongs_to :scholarity, index: true, foreign_key: true
      t.belongs_to :institution, index: true, foreign_key: true
      t.timestamps
    end
  end
end