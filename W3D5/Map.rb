class Map
    def initialize
        @map = []
    end

    def set(key, value) 
        found = false 
        if @map.length == 0
            @map << [key,value]
            return 
        end
        @map.each do |sub|
             if sub[0] == key 
                sub[1] = value
                found = true
                return
             end
        end
        if !found 
            @map << [key,value]
        end 
    end

    def get(key)
         @map.each do |sub|
             if sub[0] == key
                return sub[1]
             end
        end
        raise "Key noy found"
    end
        
    def delete(key) 
         @map.each_with_index do |sub, indx|
             if sub[0] == key
                 val = sub[1]
                @map.delete_at(indx)
                return val
             end
             raise "Could not find element"
        end
    end

    def show
        return {} if @map.length == 0
        str ="{"
        @map.each do |sub|
            str += "#{sub[0]} => #{sub[1]}," 
        end
        str = str[1...-1] + "}"#get rid of the extra comment
    end
end
