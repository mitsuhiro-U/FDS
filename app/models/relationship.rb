class Relationship < ApplicationRecord

  belongs_to :user
  belongs_to :enterprise

  validates :user_id, presence: true
  validates :enterprise_id, presence: true

end
