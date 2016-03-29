class User < ActiveRecord::Base
  authenticates_with_sorcery!
   validates :name, presence: true, uniqueness: { case_sensitive: false }, length: { in: 4..24 }
   validates :email, presence: true, uniqueness: { case_sensitive: false }
   validates :password, confirmation: true, length: { in: 6..24 }, if: :password
   validates :password_confirmation, presence: true, if: :password

end
