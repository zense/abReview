class NotificationsMailer < ApplicationMailer
  default from: "rise@iiitb.ac.in"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.notifications_mailer.review.subject
  #
  def review(review)
    @review = review
    @abstract = review.abstract_doc
    User.with_role(:admin).each do |user|
      mail(to: user.email, subject: 'All reviews submitted for abstract titled '+@abstract.title)
    end
  end

  def send_abstract(abstract)
    @abstract = abstract
    User.with_role(:admin).each do |user|
      mail(to: user.email, subject: 'New Abstract submitted: '+@abstract.title)
    end
  end
end
