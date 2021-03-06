module LostCanvas

  class PNG

    class Filter

      # Scanline filter algorithms based on the average of the previous pixel byte and the previous scanline byte.
      class Average < LostCanvas::PNG::Filter

        # Apply the Average filter over the given scanline.
        #
        # @param [<Fixnum>] data the target scanline.
        # @param [<Fixnum>] previous the previous scanline.
        # @return [<Fixnum>] the filtered scanline.
        def apply(data, previous)
          data.inject([]) do |memo, byte|
            memo << byte - ((memo.length>=self.pixel_size ? data[memo.length-self.pixel_size]:0) + (previous[memo.length]||0))/2
          end
        end
        
        # Reverts the applied Average filter over the given filtered scanline.
        #
        # @param [<Fixnum>] data the filtered scanline.
        # @param [<Fixnum>] previous the previous scanline.
        # @return [<Fixnum>] the original scanline.
        def revert(data, previous)
          data.inject([]) do |memo, byte|
            memo << byte + ((memo[-self.pixel_size]||0) + (previous[memo.length] || 0))/2
          end
        end

      end
    
    end
  
  end

end
