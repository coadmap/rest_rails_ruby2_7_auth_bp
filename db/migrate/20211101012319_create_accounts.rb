class CreateAccounts < ActiveRecord::Migration[6.1]
  def change
    enable_extension 'pgcrypto' unless extension_enabled?('pgcrypto')

    create_table :accounts, id: :uuid, comment: 'アカウント' do |t|
      t.string :email, null: false, comment: 'メールアドレス'
      t.string :password_digest, comment: '暗号化されたパスワード'

      t.string :first_name, comment: '名前'
      t.string :last_name, comment: '名字'
      t.string :first_name_kana, comment: '名前よみがな'
      t.string :last_name_kana, comment: '名字よみがな'
      t.integer :gender, null: false, default: 0, comment: '性別'
      t.date :birthday, comment: '誕生日'
      t.integer :email_verification_status, null: false, default: 0, comment: 'メールアドレス確認状態'
      t.string :email_verification_token, comment: 'メールアドレス確認用トークン'
      t.datetime :last_sign_in_at, comment: '直近のサインイン時刻'

      t.timestamps
    end

    add_index :accounts, :email, unique: true
  end
end
