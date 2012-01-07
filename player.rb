class Player

  def initialize
    @rest = 0
    @attacking = false
    @can_kill = true
  end

  def play_turn(w)

    if @rest > 0
      w.rest!
      @rest -= 1
      return
    end

    if w.feel.empty?
      if @attacking
        w.rest!
        @attacking = false
      else
        w.walk!
      end

      return
    end

    w.attack!
    @attacking = true

  end

  def resting?
    @rest != 0
  end
end
