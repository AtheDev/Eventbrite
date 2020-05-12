class UserMailer < ApplicationMailer
  default from: 'athe.dev@gmail.com'

  def welcome_email(user)
    @user = user
    @url = 'http://monsite.fr/login'
    mail(to: @user.email, subject: 'Bienvenue chez nous!')
  end

  def new_participant_email(user)
    @user = user
    @url = 'http://monsite.fr/login'
    mail(to: @user.email, subject: 'Un nouveau participant à ton évenement!')
  end

  def reset_password_instruction(user)
    @user = user
    @url = 'http://monsite.fr/login'
    mail(to: @user.email, subject: 'Reset')
  end

end
