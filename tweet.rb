require 'twitter'

class Tweet

  def initialize
    @text = ["ちゃうねん",
             "せやないねん",
             "どないやねん",
             "ええねん",
             "これや!!",
             "いけるで!!",
             "こっからや!!"]

             #https://apps.twitter.com/app/13563592/keys
             #@yuizv

    @client = Twitter::REST::Client.new do |config|
      config.consumer_key        = "pKI4stpvBPKzAWbm82kt4yy7j"
      config.consumer_secret     = "eY9e0xk60no8Uzxkk97YCAZ1zFg33PYK92HjOygiOh4gxsEZti"
      config.access_token        = "729651593239404544-6YsySiVNZVhLbE6he5unObJ0QfgwbeZ"
      config.access_token_secret = "OXVoiPIu9KZJ2pLTsyeLKSrqNaNxB8dRwODSluIVLJluv"
    end
  end

  def random_tweet
    tweet = @text[rand(@text.length)]
    update(tweet)
  end

  private

   def update(tweet) 
     begin
       @client.update(tweet)
     rescue => e
       nil #TODO
     end
   end

end

# random_tweetを実行する
if __FILE__ == $0
  Tweet.new.random_tweet
end