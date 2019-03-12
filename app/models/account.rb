class Account < ApplicationRecord
    validates_uniqueness_of :email
    has_many :posts, dependent: :destroy
    # has_many :model, :dependent => :delete_all 
    mount_uploader :image, ImageUploader
end
