class User < ApplicationRecord
  rolify
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :abstract_docs

  has_many :reviews
  has_many :abstract_reviews, through: :reviews, source: :abstract_doc
end
