# ——————————> REQUIRE <—————————— #
require 'bundler'
Bundler.require

require_relative 'lib/game'
require_relative 'lib/player'


# ——————————> SEPARATORS <—————————— #
@hash = "X"*60
@line = "—"*60


# ——————————> STARTING GAME <—————————— #
puts @line
puts @hash
puts @line
puts "#——————————————————————————————————————————————————————————#"
puts "|            ——> QUE LES MEILLEURS GAGNENT <——             |"
puts "#——————————————————————————————————————————————————————————#"
puts @hash


# ——————————> USER PLAYER <—————————— #
puts "#——————————————————————————————————————————————————————————#"
puts "|              ——>   Quel est ton nom ?   <——              |"
puts "#——————————————————————————————————————————————————————————#"
print "> "
user_player = gets.chomp.to_s
user_player = HumanPlayer.new("#{user_player}")
puts "Voici ton pseudo pour la partie: xXx-#{user_player.name.upcase}-xXx."


# ——————————> ENNEMIES <—————————— #
player1 = Player.new("Ludovic")
player2 = Player.new("Gaël")

puts "#——————————————————————————————————————————————————————————#"
puts "|                ——>  Enemis incomming  <——                |"
puts "#——————————————————————————————————————————————————————————#"

player1.show_state
player2.show_state
ennemies = [player1, player2]


# ——————————> FIGHT <—————————— #
puts @line
puts @hash
puts @line
puts "#——————————————————————————————————————————————————————————#"
puts "|           ——>      PHASE DE BAGARRE !     <——            |"
puts "#——————————————————————————————————————————————————————————#"

while user_player.life_points > 0 && (player1.life_points > 0 || player2.life_points > 0)
  
  # Affichage des états
  puts @line
  print "#{user_player.show_state}"
  print "#{player1.show_state}"
  print "#{player2.show_state}"
  puts @line

  # Affichage des action à effectuer
  puts "Quelle action veux-tu effectuer?"
  puts @line
  puts "a — Chercher au sol"
  puts "s — Se soigner"
  puts @line
  puts "Attaquer un joueur en vue:"
  print "0 — "
  print player1.show_state
  print "1 — "
  print player2.show_state

  # gameplay joueur
  puts @line
  print "> "
  user_action = gets.chomp
  puts @line

  # commande joueur
  if user_action    == "a"
    user_player.search_weapon
    puts @line
  elsif user_action == "s"
    user_player.search_health_pack
    puts @line
  elsif user_action == "0"
    user_player.attacks(player1)
    puts @line
  else user_action == "1"
    user_player.attacks(player2)
    puts @line
  end

  # Appliquer la demande de l'utilisateur
  ennemies.each do |player|
    if player.life_points > 0
      puts "Les ennemis attaquent"
      player.attacks(user_player)
    end
  end

end
# ——————————> COMBAT <—————————— #


# ——————————> THE END <—————————— #
puts @line
puts @hash
puts @line
puts "#——————————————————————————————————————————————————————————#"
puts "|               ——>     FIGHT IS OVER     <——              |"
puts "#——————————————————————————————————————————————————————————#"

# Affichage final
if user_player.life_points > 0
  puts "BIEN OUEJ LANCELOT"
else
  puts "T ES NUL ET EN PLUS T ES MORT "
end
# ——————————> THE END <—————————— #


puts @line
puts @hash
puts @line