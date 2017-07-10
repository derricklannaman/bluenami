class CreateVoterGuides < ActiveRecord::Migration[5.1]
  def change
    create_table :voter_guides do |t|
      t.references :organization, foreign_key: true
      t.string :election_name
      t.string :url

      t.timestamps
    end
  end
end
