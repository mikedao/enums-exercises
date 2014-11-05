gem 'minitest'              # => true
require 'minitest/autorun'  # => true
require 'minitest/pride'    # => true

class NonePatternTest < Minitest::Test

  def test_none_are_broken
    things = ["functional", "working", "works", "fixed", "good"]  # => ["functional", "working", "works", "fixed", "good"]
    none_broken = true                                            # => true
    things.each do |thing|                                        # => ["functional", "working", "works", "fixed", "good"]
      none_broken = false if thing == "broken"                    # => nil, nil, nil, nil, nil
    end                                                           # => ["functional", "working", "works", "fixed", "good"]
    assert none_broken                                            # => true
  end

  def test_double_negative
    numbers = [9, 3, 3, 7, 6, -5, 1]           # => [9, 3, 3, 7, 6, -5, 1]
    not_none_negative = true                   # => true
    numbers.each do |number|                   # => [9, 3, 3, 7, 6, -5, 1]
      not_none_negative = false if number < 0  # => nil, nil, nil, nil, nil, false, nil
    end                                        # => [9, 3, 3, 7, 6, -5, 1]
    refute not_none_negative                   # => false
  end

  def test_none_are_negative
    numbers = [9, 3, 1, 8, 3, 3, 5]           # => [9, 3, 1, 8, 3, 3, 5]
    none_negative = true                      # => true
    numbers.each do |number|                  # => [9, 3, 1, 8, 3, 3, 5]
      none_negative = true unless number < 0  # => true, true, true, true, true, true, true
    end                                       # => [9, 3, 1, 8, 3, 3, 5]
    assert none_negative                      # => true
  end

  def test_none_shall_pass
    critters = ["elf", "hobbit", "dwarf", "wizard", "human"]  # => ["elf", "hobbit", "dwarf", "wizard", "human"]
    none_shall_pass = true                                    # => true
    critters.each do |critter|                                # => ["elf", "hobbit", "dwarf", "wizard", "human"]
      none_shall_pass = true unless critter == 'shall pass'   # => true, true, true, true, true
    end                                                       # => ["elf", "hobbit", "dwarf", "wizard", "human"]
    assert none_shall_pass                                    # => true
  end

  def test_one_or_more_shall_pass
    phrases = ["go", "left", "can cross", "shall pass", "must stay", "tarried"]  # => ["go", "left", "can cross", "shall pass", "must stay", "tarried"]
    none_shall_pass = true                                                       # => true
    phrases.each do |phrase|                                                     # => ["go", "left", "can cross", "shall pass", "must stay", "tarried"]
      none_shall_pass = false unless phrase == 'shall pass'                      # => false, false, false, nil, false, false
    end                                                                          # => ["go", "left", "can cross", "shall pass", "must stay", "tarried"]
    refute none_shall_pass                                                       # => false
  end

  def test_none_even
    numbers = [3, 9, 15, 21, 19]            # => [3, 9, 15, 21, 19]
    none_even = false                       # => false
    numbers.each do |num|                   # => [3, 9, 15, 21, 19]
      none_even = true unless num % 2 == 0  # => true, true, true, true, true
    end                                     # => [3, 9, 15, 21, 19]
    assert none_even                        # => true
  end

end

# >> Run options: --seed 61957
# >>
# >> # Running:
# >>
# >> [38;5;154m.[0m[38;5;154m.[0m[38;5;148m.[0m[38;5;184m.[0m[38;5;184m.[0m[38;5;214m.[0m
# >>
# >> [38;5;154mF[0m[38;5;154ma[0m[38;5;148mb[0m[38;5;184mu[0m[38;5;184ml[0m[38;5;214mo[0m[38;5;214mu[0m[38;5;208ms[0m[38;5;208m [0m[38;5;203mr[0m[38;5;203mu[0m[38;5;198mn[0m in 0.001074s, 5586.5922 runs/s, 5586.5922 assertions/s.
# >>
# >> 6 runs, 6 assertions, 0 failures, 0 errors, 0 skips
