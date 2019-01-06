class CreateMicroposts < Jennifer::Migration::Base
  def up
    create_table :microposts do |t|
      t.text :content, { :null => false }
      t.string :picture

      t.reference :user

      t.timestamps
    end
  end

  def down
    drop_foreign_key :microposts, :users if foreign_key_exists? :microposts, :users
    drop_table :microposts if table_exists? :microposts
  end
end
