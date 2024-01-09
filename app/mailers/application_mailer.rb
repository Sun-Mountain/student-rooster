# frozen_string_literal: true

class ApplicationMailer < ActionMailer::Base
  default from: 'studentroosterinfo@gmail.com'
  layout 'mailer'
end
