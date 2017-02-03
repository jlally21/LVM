class Tutor < ApplicationRecord
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  has_many :matches
  has_many :students, through: :matches

  has_many :volunteer_jobs
  has_many :coordinators, through: :volunteer_jobs

  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }

  validates :first_name, presence: true, length: { maximum: 25 }
  validates :last_name, presence: true, length: { maximum: 50 }

  validates_presence_of :affiliate, :address, :city, :state, :zip, :cell_phone,
                        :gender, :native_language, :race, :training_type, :dob,
                        :referral, :education, :training, :occupation,
                        :employment, :orientation
end
