# ——————————> REQUIRE <—————————— #
require 'bundler'
Bundler.require

require_relative 'lib/game'
require_relative 'lib/player'


# ——————————> SEPARATORS <—————————— #
@hash = "X"*60
@line = "—"*60


# ——————————> PLAYERS <—————————— #
player1 = Player.new("David")
player2 = Player.new("Louis")

puts @line
puts @hash
puts @line
puts "Dans le coin Bleu : #{player1.name.upcase}!"
puts "Dans le coin Rouge : #{player2.name.upcase}!"


# ——————————> SHOW_STATE <—————————— #
print player1.show_state
print player2.show_state
puts @line
puts @hash
puts @line


# ——————————> FIGHT <—————————— #
puts "LET S GET READY TO RUUUUUUUUUMMMMMBLE !!!!!!"

while player1.life_points > 0 && player2.life_points > 0
  puts @line
  puts "A L ATTAQUE "
  puts @line
  player1.attacks(player2)
  if player2.life_points <= 0
    break
  end
  player2.attacks(player1)
  puts @line
  if player1.life_points > 0 && player2.life_points > 0
    puts "RESUMé"
    puts @line
    player1.show_state
    player2.show_state
  end 
end

puts @line
puts @hash
puts @line