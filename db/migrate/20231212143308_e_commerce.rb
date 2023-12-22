class ECommerce < ActiveRecord::Migration[7.0]
  def change
    create_table :buyers, id: :integer do |t|
      t.decimal :balance, precision: 8, scale: 2, default: 0
      t.references :user, foreign_key: true
      t.timestamps
    end

    create_table :sellers, id: :integer do |t|
      t.decimal :balance, precision: 8, scale: 2, default: 0
      t.references :user, foreign_key: true
      t.timestamps
    end

    create_table :products, id: :integer do |t|
      t.string :title
      t.decimal :price, precision: 8, scale: 2
      t.text :description, limit: 240
      t.references :seller, foreign_key: true
      t.references :buyer, foreign_key: true
      t.datetime :sold_at
      t.timestamps
    end
  end
end
