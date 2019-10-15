class Note < ApplicationRecord
    validates :title, presence: true, length: { minimum: 5, maximum: 20 }
    validates :body, presence: true, length: { minimum: 5, maximum: 200 }
    validate :contains_only_letters

    private 
    def contains_only_letters
        if title[/[a-zA-Z\s]+/] != title
            errors.add(:title, "must contain only letters.")
        end
    end
end