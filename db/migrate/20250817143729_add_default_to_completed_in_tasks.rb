class AddDefaultToCompletedInTasks < ActiveRecord::Migration[8.0]
  def change
     change_column_default :tasks, :completed, from: nil, to: false
    reversible do |dir|
      dir.up { Task.where(completed: nil).update_all(completed: false) }
    end
  end
end
