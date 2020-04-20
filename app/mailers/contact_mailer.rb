class ContactMailer < ApplicationMailer
    def contact_mail(current_user)
        @current_user = current_user
        mail to: @current_user.email, subject: "投稿の確認メール"
    end
end
