class OkashiTagRelation < ApplicationRecord
  belongs_to :okashi
  belongs_to :tag
end
