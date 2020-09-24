class Blogger < ApplicationRecord
    has_many :posts
    has_many :destinations, through: :posts

    validates :name, uniqueness: true
    validates :age, numericality: { greater_than: 0 }
    validates :bio, length: { minimum: 30 }

    def total_likes
        self.posts.map {|p| p.likes}.sum

    end

    def feat_post
        self.posts.sort_by{|post| post.likes }.first
    end

    def top_five
        self.destinations.sort_by{|d| d.num_posts}.take(5)
    end
end
