class Blog < ApplicationRecord
    belongs_to :user
    has_many :favorite
    has_many :users, through: :favorites
    mount_uploader :blog_image, BlogImageUploader
    validates :content, presence: true
    default_scope -> { order(updated_at: :desc) }
end
