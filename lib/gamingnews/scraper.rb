class Gamingnews::Scraper

    def self.scrape
        doc = Nokogiri::HTML(open("https://pcgamer.com/news/"))
        i = 0

        while i < 10
            title = doc.search("div.listingResult h3.article-name")[i].text
            author = doc.search("span.by-author span")[i].text.strip
            url = doc.search("div.listingResult a.article-link")[i].attributes["href"].value
                newdoc = Nokogiri::HTML(open(url))
            article = newdoc.search("div.text-copy p").text.chomp("\"")
            Gamingnews::News.new(title, author, article)
            i += 1
        end
    end    

end