class AddNamesToTweets < ActiveRecord::Migration[5.2]
  def change
    add_column :tweets, :Name, :string
  end
end
