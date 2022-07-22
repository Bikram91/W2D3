class Player
    def get_move
        print 'enter a position with coordinates separated with a space like `4 7`'
        response = gets.chomp
        arr = []
        response.split(" ").each do |ele|
            arr << ele.to_i
        end
        arr
    end
end
