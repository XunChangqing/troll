class AddNameZhifubaoToUser < ActiveRecord::Migration
  def change
    add_column :users, :name, :string
    add_column :users, :zhifubao, :string
  end
end
