class CreateChannelMessages < ActiveRecord::Migration[7.0]
  def change
    create_table :channel_messages do |t|
      t.timestamps
      t.references :user, null: false, foreign_key: true
      t.references :channel, null: false, foreign_key: true
      t.text :message
    end
  end
end
