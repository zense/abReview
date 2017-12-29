# Preview all emails at http://localhost:3000/rails/mailers/notifications_mailer
class NotificationsMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/notifications_mailer/review
  def review
    NotificationsMailer.review
  end

  # Preview this email at http://localhost:3000/rails/mailers/notifications_mailer/abstract
  def abstract
    NotificationsMailer.abstract
  end

end
