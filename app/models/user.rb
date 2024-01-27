class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
  has_many :post, dependent: :destroy
  has_many :post_comments, dependent: :destroy
  has_many :favorites, dependent: :destroy #いいね
  
  has_one_attached :profile_image #ユーザー画像の記述
  
  def get_profile_image(width,height) #ユーザー画像の記述
    unless profile_image.attached?
      file_path = Rails.root.join('app/assets/images/no_image.jpg')
      profile_image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
    profile_image.variant(resize_to_limit: [width,height]).processed
  end
  
   # is_deletedがfalseならtrueを返すようにしている
  def user_status
    if is_deleted == true
      "退会"
    else
      "有効"
    end
  end
  def active_for_authentication?
    super && (is_deleted == false)
  end
end
