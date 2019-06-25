class ContactMailer < ApplicationMailer

  def welcome_email
    @contact = params[:contacts]
    email_with_name = %("#{@contact.name}" <#{@contact.email}>)
    mail(to: email_with_name, subject: I18n.t('mail.welcome_email.subject'))
  end

  def unregistered_contact
    @contact = params[:contacts]
    email_with_name = %("#{@contact.name}" <#{@contact.email}>)
    mail(to: email_with_name, subject: 'Você foi Descadastrado')
  end

  def self_update_contact
    @contact = params[:contacts]
    email_with_name = %("#{@contact.name}" <#{@contact.email}>)
    mail(to: email_with_name, subject: 'Você foi Atualizado')
  end
end

# settings app rails
# action mailer template define by user
