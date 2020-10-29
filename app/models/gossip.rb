class Gossip < ApplicationRecord
    validates :title, presence: true, length: { in: 3..14 }
    validates :content, presence: true
    belongs_to :user
    belongs_to :tag
    has_many :comments
end
