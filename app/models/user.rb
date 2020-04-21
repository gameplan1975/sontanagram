class User < ApplicationRecord
    has_many :blogs
    has_many :favorite
    has_many :blogs, through: :favorites
    mount_uploader :user_image, UserImageUploader
    has_secure_password
    validates :name, presence: true, length: { maximum: 30 }
    validates :email, presence: true, length: { maximum: 255 },
        format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }
    validates :password, presence: true, length: { minimum: 6 }
    validates :password_confirmation, presence: true, length: { minimum: 6 }
end
