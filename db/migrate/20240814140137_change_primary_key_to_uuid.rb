class ChangePrimaryKeyToUuid < ActiveRecord::Migration[7.1]
  def change
    enable_extension 'pgcrypto' unless extension_enabled?('pgcrypto')

    remove_foreign_key :tasks, :schedules
    remove_foreign_key :schedules, :users

    change_table :schedules, id: false do |t|
      t.remove :id
      t.uuid :id, default: 'gen_random_uuid()', null: false
      t.index :id, unique: true # Adiciona a restrição de unicidade
    end

    change_table :tasks, id: false do |t|
      t.remove :id
      t.uuid :id, default: 'gen_random_uuid()', null: false
      t.remove :schedule_id
      t.uuid :schedule_id
    end

    change_table :users, id: false do |t|
      t.remove :id
      t.uuid :id, default: 'gen_random_uuid()', null: false
      t.index :id, unique: true # Adiciona a restrição de unicidade
    end

    change_table :schedules do |t|
      t.remove :user_id
      t.uuid :user_id
    end

    add_foreign_key :tasks, :schedules
    add_foreign_key :schedules, :users
  end
end
