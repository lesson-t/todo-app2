class Task < ApplicationRecord
    # before_action :authenticate_user!

    belongs_to :user
    belongs_to :board
    has_many :comments
    has_one_attached :eyecatch

    def author_name
        user.display_name
    end
end
