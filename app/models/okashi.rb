class Okashi < ApplicationRecord
    mount_uploader :image, ImageUploader
    belongs_to :user
    has_many :likes, dependent: :destroy
    has_many :comments, dependent: :destroy
  has_many :liked_users, through: :likes, source: :user
  has_many :okashi_tag_relations, dependent: :destroy
#tweetsテーブルから中間テーブルを介してTagsテーブルへの関連付け
  has_many :tags, through: :okashi_tag_relations, dependent: :destroy
end
