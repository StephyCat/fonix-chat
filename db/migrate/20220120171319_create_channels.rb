class CreateChannels < ActiveRecord::Migration[7.0]
  def change
    create_table :channels do |t|
      t.timestamps
      t.string :name
    end
    add_index :channels, :name, unique: true

    Channel.create!(name: 'Default')
  end
end
