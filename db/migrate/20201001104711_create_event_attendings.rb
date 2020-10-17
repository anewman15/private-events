# frozen_string_literal: true

class CreateEventAttendings < ActiveRecord::Migration[6.0]
  def change
    create_table :event_attendings do |t|
      t.integer :event_attendee_id
      t.integer :attended_event_id
      t.timestamps
    end
  end
end
