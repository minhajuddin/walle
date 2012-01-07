class Player

  def initialize
    @rest = 0
    @previous_health = 20
  end

  def play_turn(warrior)
    @warrior = warrior
    print_state

    do_it

    @previous_health = @warrior.health
  end

  def do_it
    rest_if_needed and return

    walk_if_empty and return

    attack_if_taking_damage and return

    if strong_enough?
      @warrior.attack!
    else
      @rest = 2
      @warrior.walk!(:backward)
    end

  end

  def strong_enough?
    @warrior.health > 10
  end


  def resting?
    @rest != 0
  end

  def taking_damage?
    @warrior.health < @previous_health
  end

  def attack_if_taking_damage
    return false if !taking_damage?

    attack
    true
  end

  def rest_if_needed
    return false if @rest <= 0

    puts "resting #{@rest}."
    @warrior.rest!
    @rest -= 1
    true
  end

  def walk_if_empty
    return false if !@warrior.feel.empty?

    puts "walking."
    @warrior.walk!
    true
  end

  def print_state
    puts '-' * 10
    puts "health: #{@warrior.health}, feel: #{@warrior.feel}"
    puts '-' * 10
  end

  def attack
    @warrior.attack!
  end

end
