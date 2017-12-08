module SpreeEventfulPlaces
  module_function

  def version
    Gem::Version.new VERSION::STRING
  end

  module VERSION
    MAJOR = 1
    MINOR = 0
    TINY  = 0
    PRE   = 'stable'.freeze

    STRING = [MAJOR, MINOR, TINY, PRE].compact.join('.')
  end
end
