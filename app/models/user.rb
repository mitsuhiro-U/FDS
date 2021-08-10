class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end


#def full_name
  #self.last_name + selffirst_name
#end

#def total_skill_score
  #manufacturing_status + purchasing_status + quality_management_status + food_labeling_status + management_status + " / 15"
#end