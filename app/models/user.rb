class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :prototypes
  has_many :comments

         # バリデーションを追加
  # name カラム: 必須
  validates :name, presence: true
  # profile カラム: 必須
  validates :profile, presence: true
  # occupation カラム: 必須
  validates :occupation, presence: true
  # position カラム: 必須
  validates :position, presence: true
end
