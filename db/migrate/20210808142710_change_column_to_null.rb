class ChangeColumnToNull < ActiveRecord::Migration[5.2]
 def up
    change_column :enterprises, :business_content,:string, null: true 
 end

  def down
    change_column :enterprises, :business_content,:string, null: false
  end
end
