class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :post

  #  id                   :integer          not null, primary key
  #  user_id              :integer
  #  post_id              :integer
  #  content              :text             default("")
  #  created_at           :datetime
end
