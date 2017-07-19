class AddChallengerColumnToCandidate < ActiveRecord::Migration[5.1]
  def change
    add_column :candidates, :challenger, :boolean, default: false
  end
end
