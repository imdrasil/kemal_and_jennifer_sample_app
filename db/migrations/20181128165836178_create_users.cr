class CreateUsers < Jennifer::Migration::Base
  def up
    create_table :users do |t|
      t.string :name, { :null => false }
      t.string :email, { :null => false }
      t.string :password_digest, { :null => false }
      t.bool :admin, { :null => false, :default => false }

      t.string :activation_digest
      t.bool :activated, { :null => false, :default => false }
      t.timestamp :activated_at

      t.string :reset_digest
      t.timestamp :reset_sent_at

      t.index "user_email_index", :email, type: :unique

      t.timestamps
    end
  end

  def down
    return unless table_exists? :users

    change_table :users do |t|
      t.drop_index "user_email_index"
    end

    drop_table :users
  end
end
