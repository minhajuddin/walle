class Player

  @@rest = 0

  def play_turn(w)
    w.walk! and return if w.feel.empty? && !resting?

    puts '-' * 20
    puts @@rest
    puts '-' * 20

    if @@rest > 0
      w.rest!
      @@rest -= 1
      return
    end

    if w.health > 3
      w.attack!
    else
      @@rest = 2
      w.walk!(:backward)
    end

  end

  def resting?
    @@rest != 0
  end
end
