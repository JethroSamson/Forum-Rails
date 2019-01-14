class Account < ApplicationRecord
    validates_uniqueness_of :email
    has_many :posts, dependent: :destroy
    mount_uploader :image, ImageUploader
end
