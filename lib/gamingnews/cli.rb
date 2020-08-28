class Gamingnews::CLI

    def call
        Gamingnews::Scraper.scrape
        list_news
        menu
    end

    def list_news
        puts ""
        puts "Latest Gaming News:"
        puts ""
        news = Gamingnews::News.all
        news.each.with_index(1) do |news, i| 
            puts "#{i}. #{news.title}"
        end
        puts ""
    end

    def menu
        input = nil
        while input != "exit"
            puts "Enter the number of the news heading you'd like to read more about, type 'list' to see the headings again, or type 'exit'"
            input = gets.strip.downcase

            if input.to_i > 0 && input.to_i < 11
                news_choice = Gamingnews::News.find_by_index(input.to_i - 1)
                puts ""
                puts "#{news_choice.title}"
                puts "by #{news_choice.author}"
                puts ""
                puts "#{news_choice.article}"
                puts ""
            elsif input == "list"
                list_news
            elsif input == "exit"
                puts "" 
                puts "See you later for more news!"
                puts ""
            else
                puts ""
                puts "invalid response"
                puts ""
            end
        end
    end

end