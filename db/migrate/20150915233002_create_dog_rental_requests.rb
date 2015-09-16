class CreateDogRentalRequests < ActiveRecord::Migration
  def change
    create_table :dog_rental_requests do |t|
      t.integer :dog_id, null: false
      t.date :start_date, null: false
      t.date :end_date, null: false
      t.string :status, default: "PENDING", null: false, inclusion: { in: %w(PENDING APPROVED DENIED) }

      t.timestamps null: false
    end

    add_index :dog_rental_requests, :dog_id
  end
end
