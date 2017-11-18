class User < ApplicationRecord
  has_many :posts
  has_many :comments
  #  id                   :integer          not null, primary key
  #  name                 :string(50)       default("")
end
