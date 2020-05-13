class AddOwnerToTask < ActiveRecord::Migration[6.0]
  def change
    add_reference :tasks, :owner, null: false, foreign_key: { to_table: :users }, index: true
  end
end
