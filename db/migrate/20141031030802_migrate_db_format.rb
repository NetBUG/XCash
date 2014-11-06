class MigrateDbFormat < ActiveRecord::Migration
  def apply
    create_table(:users) do |t|
      ## Database authenticatable
      t.string :email,              null: false, default: ''
      t.string :encrypted_password, null: false, default: ''

      ## Recoverable
      t.string   :reset_password_token
      t.datetime :reset_password_sent_at

      ## Rememberable
      t.datetime :remember_created_at

      ## Trackable
      t.integer  :sign_in_count, default: 0, null: false
      t.datetime :current_sign_in_at
      t.datetime :last_sign_in_at
      t.string   :current_sign_in_ip
      t.string   :last_sign_in_ip

      ## Confirmable
      # t.string   :confirmation_token
      # t.datetime :confirmed_at
      # t.datetime :confirmation_sent_at
      # t.string   :unconfirmed_email # Only if using reconfirmable

      ## Lockable
      # t.integer  :failed_attempts, default: 0, null: false # Only if lock strategy is :failed_attempts
      # t.string   :unlock_token # Only if unlock strategy is :email or :both
      # t.datetime :locked_at


      t.timestamps
	end
  end

  def change
    puts "Installing dependencies...\n"
    cmd = "sudo gem instal mongoid; " + I18n.t('mongoupdate')
    res = %x( #{cmd} )
    Dir.glob(Rails.root.to_s + "/config/locales/??.yml").each do |file| 
		cmd = "cat " + file + " | grep -v mongo > " + file + "_; mv " + file + "_ " + file
		res = %x( #{cmd} )
	end
    last_migration = Dir.glob(Rails.root.to_s + "/db/migrate/*").map{ |file| [file,File.ctime(file)]}.max.first
    File.delete(last_migration)
 end
end
