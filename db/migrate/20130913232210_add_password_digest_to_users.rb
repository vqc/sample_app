class AddPasswordDigestToUsers < ActiveRecord::Migration
  def change
    #uses the add_column method to add a password_digest column to the user's table
    add_column :users, :password_digest, :string
  end
end
