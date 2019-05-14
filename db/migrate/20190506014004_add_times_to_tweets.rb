class AddTimesToTweets < ActiveRecord::Migration[5.2]
  def change
    add_column :tweets, :time, :datetime
  end
end
