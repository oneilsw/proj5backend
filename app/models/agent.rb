class Agent < ApplicationRecord
    has_one :account, as: :user, dependent: :destroy

    has_many :listings, dependent: :destroy

    has_many :open_houses, through: :listings

    has_many :viewings, through: :listings
    has_many :viewing_tenants, through: :viewings, source: :tenants

    has_many :agent_reviews
    has_many :tenants_with_reviews, through: :agent_reviews, source: :tenants

    validates :first_name, presence: true
    validates :last_name, presence: true
    validates :phone, presence: true
    validates :bio, presence: true
    validates :brokerage, presence: true

    def full_name
        self.first_name.capitalize + " " + self.last_name.capitalize 
    end 
end
