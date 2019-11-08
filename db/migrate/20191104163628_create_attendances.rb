class CreateAttendances < ActiveRecord::Migration[5.2]

  def change
    create_table :attendances do |t|

#informations pour le paiement 
      t.string :stripe_customer_id
      t.integer :amount
      t.string :currency
      t.string :description

#liens avec autres tables
      t.belongs_to :user
      t.belongs_to :event

      t.timestamps
    end
  end
end
