require_relative "code"

class Mastermind
    def initialize(length)
        @secret_code = Code.random(length)
    end

    def print_matches(code)
        print @secret_code.num_exact_matches(code) 
        print @secret_code.num_near_matches(code) 

    end

    def ask_user_for_guess
        print 'Enter a code'
        code = gets.chomp
        guess = Code.from_string(code)
        self.print_matches(guess)
        if @secret_code == guess
            return true
        else
            false
        end
    end
end
