class Player

  attr_accessor :name
  attr_accessor :life_points

  def initialize(name)
    @name        = name
    @life_points = 10
  end

  def show_state
    if life_points > 0
      puts "#{@name} a #{@life_points} points de vie ♥️"
    else life_points <= 0
      puts "Le joueur #{name} est mort..."
    end
  end

  def gets_damage(damage_dealt)
    @life_points = @life_points - damage_dealt
    if @life_points <= 0
      puts "Le joueur #{@name} a été tué !"
    end
  end

  def attacks(player)
    puts "#{@name} attaque #{player.name} 💥"
    random_damage = compute_damage 
    puts "Il lui inflige #{random_damage} points de dommages."
    player.gets_damage(random_damage)
  end

  def compute_damage
    return rand(1..6)
  end

end

class HumanPlayer < Player

  attr_accessor :weapon_level

  def initialize(name)
    @weapon_level = 1
    super(name)
    @life_points  = 100
  end

  def show_state
    puts "#{@name} a #{@life_points} points de vie ♥️  et une arme de niveau #{@weapon_level}."
  end

  def compute_damage
    rand(1..6) * @weapon_level
  end

  def search_weapon
    random_number_weapon = rand(1..6)
    puts "Tu as trouvé une arme de niveau #{random_number_weapon}"
    if random_number_weapon > @weapon_level
      puts "Nickel, je vais bien les atomiser, je la garde."
      @weapon_level = random_number_weapon
    else 
      puts "M@*#$... inutile"
    end
  end

  def search_health_pack
    random_number_health = rand(1..6)
    if random_number_health == 1
      puts "Tu n'as rien trouvé"
    elsif random_number_health >= 2 && random_number_health < 6
      puts "Bravo, tu as trouvé un pack de 50 points de vie !"
      if @life_points <= 50
        @life_points = life_points + 50
      else
        @life_points = 100
      end
    else random_number_health == 6
      puts "Bravo, tu as trouvé un pack de 80 points de vie !"
      if @life_points <= 20
        @life_points = life_points + 80
      else
        @life_points = 100
      end  
    end
    puts "Tes points de vie actuels sont de: #{@life_points}."
  end

end

