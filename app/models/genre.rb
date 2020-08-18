class Genre < ApplicationRecord
	belongs_to :items

	enum is_active:["true", "false"]
end
