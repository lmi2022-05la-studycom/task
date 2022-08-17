class AddDetailsToTasks < ActiveRecord::Migration[6.1]
  def change
    add_column :tasks, :started_at, :datetime 
    add_column :tasks, :limited_at, :datetime 
  end
end
