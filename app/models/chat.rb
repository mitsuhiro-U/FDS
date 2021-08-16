class Chat < ApplicationRecord

  belongs_to :user
  belongs_to :enterprise
  belongs_to :room

end
