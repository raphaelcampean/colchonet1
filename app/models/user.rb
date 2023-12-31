class User < ApplicationRecord
	extend FriendlyId
	friendly_id :full_name, use: [:slugged, :history]
	
	has_many :reviews, dependent: :destroy
	has_many :rooms, dependent: :destroy
	
	EMAIL_REGEXP = /\A[^@]+@([^@\.]+\.)+[^@\.]+\z/

	validates_presence_of :email, :full_name, :location
	validates_length_of :bio, minimum: 30, allow_blank: false
	validates_uniqueness_of :email
	validates_format_of :email, with: EMAIL_REGEXP 

	has_secure_password

	before_create do |user|
		user.confirmation_token = SecureRandom.urlsafe_base64
	end

	def confirm!
		return if confirmed?
			self.confirmed_at = Time.current
			self.confirmation_token = ''
			save!
	end
	
	def confirmed?
		confirmed_at.present?
	end

	scope :confirmed, -> { where.not(confirmed_at: nil) }

	def self.authenticate(email, password)
		user = confirmed.find_by(email: email).try(:authenticate, password)
	end

	validate :email_format

	private

	def email_format
		errors.add(:email, :invalid) unless email.match(EMAIL_REGEXP)
	end
end

