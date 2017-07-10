class CreateOffices < ActiveRecord::Migration[5.1]
  def change
    create_table :offices do |t|
      t.string :title
      t.string :level
      t.string :term
      t.references :voter_guide, foreign_key: true

      t.timestamps
    end
  end
end
