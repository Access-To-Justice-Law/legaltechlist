class SuggestionMailer < ApplicationMailer
  default from: 'no-reply@codex.stanford.edu'
  
  #send a new company e-mail with the parameters passed in
  def newcompany_email(company)
    @company = company
    @message = t('mailers.company.created')
    
    emails = AdminUser.all.collect(&:email).join(",")

    mail(:to => emails, :subject => "#{t('site_title')}: #{@message}")
    
  end
  
  # send an edit company e-mail with the paramaters passed in
  def editcompany_email(company)
    @company = company
    @message = t('mailers.company.updated')
    
    emails = AdminUser.all.collect(&:email).join(",")

    mail(:to => emails, :subject => "#{t('site_title')}: #{@message}")
  end

end
