class CreateTasks < ActiveRecord::Migration[6.1]
  def change
    create_table :tasks do |t|
      t.references :user, null: false, forign_key:true
      t.references :tag, null: false, forign_key:true
      t.text :content, null: false 
      t.string :status, null: false, default: 1
      t.datetime :started_at, null: false
      t.datetime :limited_at, null: true
      t.timestamps
    end
  end
end
