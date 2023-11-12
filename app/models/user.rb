class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         has_many :okashis, dependent: :destroy
         has_many :likes, dependent: :destroy
         mount_uploader :image, ImageUploader
  has_many :liked_okashis, through: :likes, source: :okashi
  has_many :comments, dependent: :destroy
  has_many :tweets, dependent: :destroy #追記 ユーザーが削除されたら、ツイートも削除されるようになります。すでに書いてある場合は追記しなくて大丈夫です。
  validates :name, presence: true #追記
  validates :profile, length: { maximum: 200 } #追記
  def already_liked?(okashi)
    self.likes.exists?(okashi_id: okashi.id)
  end
end
