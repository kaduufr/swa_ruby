module Input
    def get_name
        puts '> Welcome to Star Wars Info'
        puts '> Who you want meet??'
        name = gets.chomp
        name
    end  

    def get_type

        types = {
            'people': 'Pessoas',
            'planets': 'Planetas',
            'films': 'Filmes',
            'species': 'Especies',
            'starships': 'Naves',
            'vehicles': 'Veiculos'
        }

        puts "\n\n"
        puts '> Choose what are you searching:'

        types.each_with_index do |item, index|
            puts "#{index + 1} -- #{item[1]}"
        end

        optionChoosed = gets.to_i

        raise IndexError.new('Index not find') if optionChoosed < 0 || optionChoosed > 6

        return types.keys[optionChoosed - 1]
    end
end