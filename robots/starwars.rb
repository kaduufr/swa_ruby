require 'open-uri'

module SWRobot
    def get_url type
        urls = {
            "films": "https://swapi.dev/api/films/",
            "people": "https://swapi.dev/api/people/",
            "planets": "https://swapi.dev/api/planets/",
            "species": "https://swapi.dev/api/species/",
            "starships": "https://swapi.dev/api/starships/",
            "vehicles": "https://swapi.dev/api/vehicles/"
        }

        urls[type.to_sym]
    end

    def get_info name, type
        data = get_info_by_api name, type
        dataJSON = JSON.parse(data)
        if dataJSON['count'] == 0
            puts '> Nome nao encontrado / Opção errada'
            raise ArgumentError.new('Argument wrong') 
        end
        films_array = get_title_at_all_films dataJSON['results'][0]['films']
        hw_name = get_homeworld_name dataJSON['results'][0]['homeworld']
        return {
            name: name,
            type: type,
            full_name: dataJSON['results'][0]['name'],
            films: films_array,
            homeworld: hw_name
        }
    end

    def get_info_by_api name, type
        type_url = get_url type

        url_formated = "#{type_url}?search=#{name}"

        puts '> Searching Info...'
        URI.open(url_formated).read
    end

    def get_title_at_all_films films_url

        films_title = []

        films_url.each do |url|
            data_film = URI.open(url).read
            films_title.push(
                get_title_by_film data_film
            )
        end

        return films_title
    end

    def get_title_by_film data_film
        data_film_json = JSON.parse(data_film)
        return data_film_json['title']
    end

    def get_homeworld_name homew_url
        data_hw_json = URI.open(homew_url).read
        data_hw = JSON.parse data_hw_json
        
        data_hw['name']
    end
end