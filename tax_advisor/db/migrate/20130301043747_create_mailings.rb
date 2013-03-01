class CreateMailings < ActiveRecord::Migration
  def change
    create_table :mailings do |t|
      t.string :email
      t.string :from
      t.string :subject
      t.string :body
      t.string :photo

      t.timestamps
    end
  end
end
