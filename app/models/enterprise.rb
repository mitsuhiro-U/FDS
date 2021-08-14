class Enterprise < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
  has_many :relationships, foreign_key: "enterprise_id", dependent: :destroy
  has_many :followings, through: :relationships, source: :user
  
  has_many :passive_relationships, class_name: "Relationship", foreign_key: "user_id", dependent: :destroy
  has_many :followers, through: :passive_relationships, source: :enterprise
  
  def following?(user)
    self.followings.include?(user)
  end

  def follow(user)
    self.relationships.find_or_create_by(user_id: user.id)
  end
  
  def unfollow()
    relationship = self.relationships.find_by(user_id: user.id)
    relationship.destroy if relationship
  end
  
end
