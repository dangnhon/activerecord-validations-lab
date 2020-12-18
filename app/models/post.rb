class Post < ActiveRecord::Base
    belongs_to :author
    validates :title, presence: true
    validate :clickbaity
    validates :content, length: {minimum: 250}
    validates :summary, length: {maximum: 250}
    validates :category, inclusion: { in: ["Fiction", "Non-Fiction"], message: "Not Valid" }
    
# This custom validation method was a pain in *ss
    def clickbaity
        array = ["Won't Believe", "Secret" , "Top[number]", "Guess"]
        if self.title 
            unless array.any? {|word| self.title.include? word}
                errors.add(:title, "title is not clickbaity")
            end 
        end 
    end

end
