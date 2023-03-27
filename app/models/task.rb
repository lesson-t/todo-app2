class Task < ApplicationRecord
    # before_action :authenticate_user!

    belongs_to :user

    def author_name
        user.display_name
    end
end
