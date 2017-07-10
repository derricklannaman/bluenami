class AddYearToGuide < ActiveRecord::Migration[5.1]
  def change
    add_column :voter_guides, :year, :string
  end
end
