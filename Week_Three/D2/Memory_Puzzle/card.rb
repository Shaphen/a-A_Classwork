class Card
    attr_reader :face, :current_state, :back
    def initialize(face)
        @face = face
        @back = " "
        @current_state = @back

    end

    def hide
        if @current_state == @face
            @current_state = @back
        end
    end

    def reveal
        if @current_state == @back
            @current_state = @face
        end
    end

    def ==(card) 
        if self.face == card.face
            return true
        else
            return false
        end
    end

    # def to_s(ele)
    #     ele = "#{ele}"
    # end

end