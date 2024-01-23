class UserMailer < ApplicationMailer
    default from: 'jasleenkaurkhanuja13@gmail.com'
    def welcome_email 
        @user = (params[:user])
        @url = 'google.com'
        mail(to: @user.email, subject:"Welcome to The Eras Tour")
    end
end
