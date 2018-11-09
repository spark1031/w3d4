class ChangePolls < ActiveRecord::Migration[5.1]
  def change
    change_column :polls, :title, :string, null: false
  end
end
