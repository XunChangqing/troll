class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.integer :owner_id
      t.datetime :request_at
      t.datetime :finish_at
      t.integer :result
      t.integer :check_result
      t.integer :checker_id
      t.datetime :check_at
      t.string :url

      t.timestamps null: false
    end
  end
end
