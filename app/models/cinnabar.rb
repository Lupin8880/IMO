class Cinnabar < ActiveRecord::Base
    validates :content, presence: true
    validates :content, length: { maximum: 140 }
end
