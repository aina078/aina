class Tag < ApplicationRecord
    has_many :okashi_tag_relations, dependent: :destroy
  #Tagsテーブルから中間テーブルを介してArticleテーブルへの関連付け
  has_many :okashis, through: :okashi_tag_relations, dependent: :destroy
end
