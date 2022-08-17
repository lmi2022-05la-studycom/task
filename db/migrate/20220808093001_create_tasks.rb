class CreateTasks < ActiveRecord::Migration[6.1]
  def change
    create_table :tasks do |t|
      t.references :user, null: false, forign_key:true
      t.references :tag, null: false, forign_key:true
      t.text :content, null: false 
      t.string :status, null: false, default: 1
      # add_column :tasks, :status, :string, default: 1
      t.datetime :started_at, null: false
      # add_column :tasks, :started_at, :datetime 
      t.datetime :limited_at, null: true
      # add_column :tasks, :limited_at, :datetime 

      t.timestamps
    end
  end
end
