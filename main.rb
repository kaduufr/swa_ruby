require_relative './robots/input.rb'

class Application
    include Input

    def initialize
        name = get_name()
        type = get_type()

    end

end

Application.new()