class CreateTodousers < ActiveRecord::Migration[5.1]
  def change
    create_table :todousers do |t|
      t.references :user, foreign_key: true
      t.references :todo, foreign_key: true
      t.boolean :done

      t.timestamps
    end
  end
end
