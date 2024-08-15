class CreateTasks < ActiveRecord::Migration[7.2]
  def change
    create_table :tasks do |t|
      t.string :title
      t.integer :hour
      t.text :reason
      t.text :before_situtation
      t.text :after_situation
      t.text :after_action
      t.text :other
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
