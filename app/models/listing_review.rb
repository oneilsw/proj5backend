class ListingReview < ApplicationRecord
    belongs_to :tenant
    belongs_to :listing
end
