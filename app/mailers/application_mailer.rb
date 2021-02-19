class ApplicationMailer < ActionMailer::Base
  default from: 'apprAIse-factory',
          reply_to: "nonreply"
  layout 'mailer'
end
