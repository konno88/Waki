class Article < ApplicationRecord
    belongs_to :user

    def user_email
        user.email
    end
end
