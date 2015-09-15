class CreateDogs < ActiveRecord::Migration
  def change
    create_table :dogs do |t|
      t.string :name, null: false
      t.date :birth_date, null: false
      t.string :color, null: false, inclusion: { in: %w(black white brown gray red) }
      t.string :sex, null: false, limit: 1, inclusion: { in: %w(M F) }
      t.text :description, null: false

      t.timestamps null: false
    end
    add_index :dogs, :name
    add_index :dogs, :birth_date
    add_index :dogs, :color
    add_index :dogs, :sex
  end
end
