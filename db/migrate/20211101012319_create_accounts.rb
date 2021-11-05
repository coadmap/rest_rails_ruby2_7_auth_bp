class CreateAccounts < ActiveRecord::Migration[6.1]
  def change
    enable_extension 'pgcrypto' unless extension_enabled?('pgcrypto')

    create_table :accounts, comment: 'アカウント' do |t|
      t.string :email, null: false, comment: 'メールアドレス'
      t.string :password_digest, comment: '暗号化されたパスワード'

      t.string :first_name, null: false, comment: '名前'
      t.string :last_name, null: false, comment: '名字'
      t.string :first_name_kana, null: false, comment: '名前よみがな'
      t.string :last_name_kana, null: false, comment: '名字よみがな'
      t.integer :gender, null: false, default: 0, comment: '性別'
      t.date :birthday, null: false, comment: '誕生日'
      t.integer :email_verification_status, default: 0, comment: 'メールアドレス確認状態'
      t.datetime :last_sign_in_at, comment: '直近のサインイン時刻'

      t.timestamps
    end
  end
end
