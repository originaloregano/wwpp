class AddTypesOfUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users
  end
end
