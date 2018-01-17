require 'twitter'
puts "Consumer key ?"
twitter_key = gets.chomp

puts "Consumer secret ?"
twitter_secret = gets.chomp

puts "Token ?"
twitter_token = gets.chomp

puts " Token secret ?"
twitter_token_secret = gets.chomp


client = Twitter::Streaming::Client.new do |config|
  config.consumer_key        = twitter_key
  config.consumer_secret     = twitter_secret
  config.access_token        = twitter_token
  config.access_token_secret = twitter_token_secret
end
i = 0
topics = ["THP","TheHackingProject","stuv"]
client.filter(track: topics.join(", ")) do |object|
  puts object.text if object.is_a?(Twitter::Tweet)
  i += 1
  if i > 0
    client = Twitter::REST::Client.new do |config|
  config.consumer_key        = twitter_key
  config.consumer_secret     = twitter_secret
  config.access_token        = twitter_token
  config.access_token_secret = twitter_token_secret
end
client.favorite(object)
client.update" @#{object.user.screen_name}: Bah alors ??? "
    client.follow(object.user.screen_name)
end
end

