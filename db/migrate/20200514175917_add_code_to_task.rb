class AddCodeToTask < ActiveRecord::Migration[6.0]
  def change
    add_column :tasks, :code, :string
  end
end
