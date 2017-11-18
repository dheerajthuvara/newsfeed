class Post < ApplicationRecord
  belongs_to :user
  has_many :comments
  has_many :commented_users, through: :comments, source: :user

  #  id                   :integer          not null, primary key
  #  user_id              :integer
  #  content              :text             default("")
  #  created_at           :datetime
end
