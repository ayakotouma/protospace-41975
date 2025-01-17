class Prototype < ApplicationRecord
  # Active Storageで画像を1つ添付
  has_one_attached :image
  # アソシエーション
  belongs_to :user
  has_many :comments, dependent: :destroy
  # バリデーション
  validates :title, presence: true
  validates :catch_copy, presence: true
  validates :concept, presence: true
  validates :image, presence: true
end
