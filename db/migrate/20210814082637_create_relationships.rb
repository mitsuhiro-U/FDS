class CreateRelationships < ActiveRecord::Migration[5.2]
  def change
    create_table :relationships do |t|
      t.references :user, foreign_key: true
      t.references :enterprise, foreign_key: true

      t.timestamps

      t.index [:user_id, :enterprise_id], unique: true

    end
  end
end
