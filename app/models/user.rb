class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
  has_many :post, dependent: :destroy
  
  def user_status
    if is_deleted == true # is_deletedがfalseならtrueを返すようにしている
      "退会"
    else
      "有効"
    end
  end

end
