class User < ApplicationRecord
    has_many :blogs
    has_many :favorite
    has_many :blogs, through: :favorites
    mount_uploader :user_image, UserImageUploader
    has_secure_password
    validates :name, presence: true
    validates :email, presence: true
    
end
