# frozen_string_literal: true

class CreateEvents < ActiveRecord::Migration[6.0]
  def change
    create_table :events do |t|
      t.string :event_name
      t.text :description
      t.string :event_location
      t.datetime :event_date
      t.timestamps
      t.references :creator
    end
  end
end
