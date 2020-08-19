class Genre < ApplicationRecord
	#belongs_to :items

	validates :neme,  presence: true
end
