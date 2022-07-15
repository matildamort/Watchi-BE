class CreateShows < ActiveRecord::Migration[6.1]
  def change
    create_table :shows do |t|
      t.string :title
      t.string :description
      t.boolean :crunchyroll
      t.boolean :netflix
      t.boolean :funimation
      t.integer :episodes
      t.date :airdate
      t.date :enddate

      t.timestamps
    end
  end
end
