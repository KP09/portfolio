class AddContributionToContributions < ActiveRecord::Migration[5.1]
  def change
    add_column :contributions, :file, :string
  end
end
