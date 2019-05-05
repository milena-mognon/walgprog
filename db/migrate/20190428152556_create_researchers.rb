class CreateResearchers < ActiveRecord::Migration[5.2]
  def change
    create_table :researchers do |t|
      t.string :name
      t.string :title
      t.string :academic_title
      t.string :genre
      t.integer :institution_affiliation, foreign_key: true
      t.string :image
      t.timestamps
    end
  end
end
