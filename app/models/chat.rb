class Chat < ApplicationRecord

  belongs_to :user, optional: true
  belongs_to :enterprise, optional: true
  belongs_to :room

end
