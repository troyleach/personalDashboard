class RemoveEncryptedPasswordandSaltFromUsers < ActiveRecord::Migration[5.1]
  def change
    remove_column :users, :encrypted_password, :string
    remove_column :users, :salt, :string
    add_column :users, :password_digest, :string
  end
end