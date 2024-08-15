class ChangeColumnName < ActiveRecord::Migration[7.2]
  def change
    rename_column :tasks, :before_situtation, :before_situation
  end
end
