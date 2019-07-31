# frozen_string_literal: true

class CreateLists < ActiveRecord::Migration[5.2]
  def change
    create_table :lists do |t|
      t.references :user, foreign_key: true
      t.string :name, unique: true
      t.timestamps
    end
    add_index :lists, :name
  end
end
