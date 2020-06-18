# frozen_string_literal: true

class DeviseCreateGuides < ActiveRecord::Migration[6.0]
  def change
    create_table :guides do |t|
      ## Database authenticatable
      t.string :email,              null: false, default: ""
      t.string :encrypted_password, null: false, default: ""

      ## Recoverable
      t.string   :reset_password_token
      t.datetime :reset_password_sent_at

      ## Rememberable
      t.datetime :remember_created_at

      ## Trackable
      # t.integer  :sign_in_count, default: 0, null: false
      # t.datetime :current_sign_in_at
      # t.datetime :last_sign_in_at
      # t.string   :current_sign_in_ip
      # t.string   :last_sign_in_ip

      ## Confirmable
      # t.string   :confirmation_token
      # t.datetime :confirmed_at
      # t.datetime :confirmation_sent_at
      # t.string   :unconfirmed_email # Only if using reconfirmable

      ## Lockable
      # t.integer  :failed_attempts, default: 0, null: false # Only if lock strategy is :failed_attempts
      # t.string   :unlock_token # Only if unlock strategy is :email or :both
      # t.datetime :locked_at


      t.timestamps null: false
      t.boolean 'is_active', default: true
      t.string 'family_name'
      t.string 'name'
      t.string 'nationality'
      t.string 'identification_image_id'
      t.string 'postal_code'
      t.string 'address'
      t.string 'phone_number'
      t.text 'introduction'
      t.string 'selfy_image_id'
      t.datetime 'deleted_at'
    end

    add_index :guides, :email,                unique: true
    add_index :guides, :reset_password_token, unique: true
    # add_index :guides, :confirmation_token,   unique: true
    # add_index :guides, :unlock_token,         unique: true
  end
end
