class Note < ApplicationRecord
    validates :title, presence: true, length: { minimum: 5, maximum: 20 }
    validates :body, presence: true, length: { minimum: 5, maximum: 200 }
    validate :contains_only_letters

    private 
    def contains_only_letters
        if !:title.match(/^[[:alpha:][:blank:]]+$/)
            errors.add(:title, "cannot contains digits or special characters!")
        end
    end
end