# frozen_string_literal: true

class CreateTasks < ActiveRecord::Migration[5.2]
  def change
    create_table :tasks do |t|
      t.references :list, foreign_key: true
      t.string :content
      t.boolean :progress
      t.timestamps
    end
  end
end
