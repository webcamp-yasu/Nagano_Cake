class Genre < ApplicationRecord
	belongs_to :items

	enum is_active:[:有効, :無効]
end
