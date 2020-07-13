class ContactMailer < ApplicationMailer
    def send_when_admin_reply(user, admin_text)
        @user = user # ユーザー情報
        @answer = admin_text # 返信内容
        mail to: user.email, subject: '【FANTRA】お問い合わせありがとうございます'
    end
end
