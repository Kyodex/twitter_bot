require 'twitter'
require 'pry'

journalist =  ["ThibautGrx","AnthoKerlizou","zinhosama","marionsouzeau","BenchiZer","stuvpic","Zlauwereys","MeLonguet","DorotheeLN","NolwennCosson","ADaboval","Remibaldy","LColcomb","KerinecMoran","NassiraELM","NewsRicard","Sandreene","Emilezrt","Pierre_Do","Micode","CColumelli","DavidAbiker","ClementBergantz","benjaminrabier"]

puts "Consumer key ?"
twitter_key = gets.chomp
puts "Consumer secret ?"
twitter_secret = gets.chomp
puts "Token ?"
twitter_token = gets.chomp
puts " Token secret ?"
twitter_token_secret = gets.chomp

client = Twitter::REST::Client.new do |config|
  config.consumer_key        = twitter_key
  config.consumer_secret     = twitter_secret
  config.access_token        = twitter_token
  config.access_token_secret = twitter_token_secret
end
p client

for i in (0..journalist.length-1)
client.update('Suprise tweet bro @' + journalist[i] + ' .Eleve de The hacking project :Je test la vie. Allez voir @stuvpic il fait des photos genial ^^ !')
client.follow(journalist[i])
end


binding.pry
