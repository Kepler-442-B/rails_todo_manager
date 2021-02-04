class UpdateUsers < ActiveRecord::Migration[6.1]
  def change
    change_table :users do |t|
      t.remove :password, :name
      t.string :first_name
      t.string :last_name
      t.string :password_digest
    end
  end
end
