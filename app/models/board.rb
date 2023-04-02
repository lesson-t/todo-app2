class Board < ApplicationRecord
    # before_action :authenticate_user!

    belongs_to :user
    has_many :tasks, dependent: :destroy

    def author_name
        user.display_name
    end
end
