class CreateWatchshows < ActiveRecord::Migration[6.1]
  def change
    create_table :watchshows do |t|
      t.references :show, null: false, foreign_key: true
      t.references :watchlist, null: false, foreign_key: true

      t.timestamps
    end
  end
end
