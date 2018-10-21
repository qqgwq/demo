class User < ActiveRecord::Base
  has_secure_password
  enum gender: ["female", "male"]
end
