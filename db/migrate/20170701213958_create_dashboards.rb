class CreateDashboards < ActiveRecord::Migration[5.1]
  def change
    create_table :dashboards do |t|
      t.references :organization, foreign_key: true

      t.timestamps
    end
  end
end
