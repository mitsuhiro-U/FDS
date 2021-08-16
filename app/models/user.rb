class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :relationships, foreign_key: "user_id", dependent: :destroy
  has_many :followings, through: :relationships, source: :enterprise

  has_many :passive_relationships, class_name: "Relationship", foreign_key: "user_id", dependent: :destroy
  has_many :followers, through: :passive_relationships, source: :enterprise

  def following?(enterprise)
    self.followings.include?(enterprise)
  end

  def follow(enterprise)
    self.relationships.find_or_create_by(enterprise_id: enterprise.id)
  end

  def unfollow(enterprise)
    relationship = self.relationships.find_by(enterprise_id: enterprise.id)
    relationship.destroy if relationship
  end

  def full_name
    self.last_name + " " + self.first_name + " 様"
  end

  def gender_is
    if self.gender == 0
      "男性"
    elsif self.gender == 1
      "女性"
    end
  end

  def age_is
    (Date.today.strftime("%Y%m%d").to_i - self.birthday.strftime("%Y%m%d").to_i) / 10000
  end

  def specialized_field_is
    if self.specialized_field.blank?
      "未記入"
    else
      self.specialized_field
    end
  end

  def total_score
     if self.manufacturing_status.blank?
      "未記入"
     else
      (self.number + self.manufacturing_status + self.purchasing_status +
       self.quality_management_status + self.food_labeling_status + self.management_status).to_s + " / 18"
     end
  end



end