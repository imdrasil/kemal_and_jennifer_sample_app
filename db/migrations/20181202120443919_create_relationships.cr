class CreateRelationships < Jennifer::Migration::Base
  def up
    create_table :relationships do |t|
      t.integer :follower_id, { :null => false }
      t.integer :followed_id, { :null => false }

      t.index "followed_id_index", :followed_id
      t.index "follower_id_followed_id_index", [:follower_id, :followed_id], type: :unique

      t.timestamps
    end
  end

  def down
    drop_table :relationships if table_exists? :relationships
  end
end
