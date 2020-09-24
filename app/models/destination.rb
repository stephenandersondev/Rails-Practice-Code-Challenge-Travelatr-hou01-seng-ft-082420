class Destination < ApplicationRecord
    has_many :posts
    has_many :bloggers, through: :posts

    def feat_post
        self.posts.sort_by{|post| post.likes}.first
    end

    def avg_age
        bloggers = self.bloggers.uniq
        ages = bloggers.collect{|b| b.age}
        (ages.sum) / ages.count
    end

    def recent_five
        self.posts.sort_by{|p| p.created_at}.take(5)
    end

    def num_posts
        self.posts.count
    end
end
