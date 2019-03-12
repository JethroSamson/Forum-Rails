class Post < ApplicationRecord
  belongs_to :account
  has_many :comments, dependent: :destroy
  mount_uploader :image, ImageUploader
end
