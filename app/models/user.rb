class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # User has_many comments.
  has_many :comments

  # for authenticate_admin method check role column value
  def admin?
    return self.role == "admin"
  end

  # 掛載 carrierwave upload for upload image
  mount_uploader :avatar, PhotoUploader
end
