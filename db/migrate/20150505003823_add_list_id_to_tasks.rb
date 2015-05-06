class AddListIdToTasks < ActiveRecord::Migration
  def change
    add_column :tasks, :list_id, :integer
    remove_column :tasks, :user_id
  end

end
