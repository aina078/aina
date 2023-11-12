class Like < ApplicationRecord
  belongs_to :okashi
  belongs_to :user
  validates_uniqueness_of :okashi_id, scope: :user_id
end
