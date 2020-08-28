class Gamingnews::News
    attr_accessor :title, :author, :article

    @@all = []

    def initialize(title, author, article)
        @title = title
        @author = author
        @article = article
        @@all << self
    end

    def self.all
        @@all
    end

    def self.find_by_index(index)
        @@all[index]
    end

end