class CreateUsuarios < ActiveRecord::Migration[8.0]
  def change
    create_table :usuarios do |t|
      t.string :nome, null: false
      t.string :sobrenome, null: false
      t.string :email, null: false
      t.string :senha_digest, null: false

      t.timestamps
    end
    add_index :usuarios, :email, unique: true
  end
end
