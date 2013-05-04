class Contact
  include ActiveAttr::Model

  attribute :name
  attribute :email
  attribute :subject
  attribute :message

  attr_accesible :name, :email, :subject, :message

  validates_presence_of :name
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true,
                    format: { with: VALID_EMAIL_REGEX }
  validates :subject, presence: true,
                      length: { maximum: 100 }
  validates :message, presence: true
end
