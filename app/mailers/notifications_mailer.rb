class NotificationsMailer < ApplicationMailer
  default from: "rise_phd@iiitb.ac.in"

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

  def abstract_ack(abstract)
    @abstract = abstract
    mail(to: @abstract.user.email, subject: 'Thank You for submitting your abstract: '+@abstract.title)
  end

  def review_ack(review)
    @review = review
    mail(to: @review.user.email, subject: 'Thank You for submitting your review for the abstract titled: '+@review.abstract_doc.title)
  end

  def open_house_ack(entry)
    @entry = entry
    mail(from: 'rise_oh@iiitb.ac.in', to: entry.email, subject: 'Thank You for registering for <%= Site.meta(:name) %> Open House')
  end

  def open_studio_ack(entry)
    @entry = entry
    mail(from: 'rise_os@iiitb.ac.in', to: entry.email, subject: 'Thank You for registering for <%= Site.meta(:name) %> Open Studio')
  end
end
