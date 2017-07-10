class CreateIncumbents < ActiveRecord::Migration[5.1]
  def change
    create_table :incumbents do |t|
      t.references :office, foreign_key: true
      t.string :first_name
      t.string :last_name
      t.string :party
      t.string :bio

      t.timestamps
    end
  end
end
