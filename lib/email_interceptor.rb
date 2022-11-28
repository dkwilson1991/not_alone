class EmailInterceptor
  def self.delivering_email(message)
    message.subject = "#{message.to} #{message.subject}"
    message.to = [ 'naumenkoyuliya@ukr.net' ]
  end
end
