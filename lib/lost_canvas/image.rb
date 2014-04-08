module LostCanvas

  # LostCanvas Image representation.
  class Image

    def initialize pixels, encoding
      @encoding = encoding
      @pixels = pixels
    end
 
    # Open and decode the given file. 
    #
    # @param [String] file_path path to the target image file.
    # @return [LostCanvas::Image] abstract image representation.
    def self.open file_path
      if IO.binread(file_path, 8) == LostCanvas::PNG::SIGNATURE 
        LostCanvas::PNG.decode(File.open(file_path, 'rb'))
      end
    end

    # Returns the image encoding configuration.
    #
    # @return [OpenStruct] image encoding information.
    def encoding
      @encoding ||= OpenStruct.new
    end
   
    # Returns the image heigth in pixels.
    #
    # @return [Fixnum] image height in pixels.
    def heigth
      @pixels.row_count
    end

    # Encode and save the image.
    #
    # @return [TrueClass] whether the image was successfully saved or not. 
    def save
      true
    end

    # Returns the image width in pixels.
    #
    # @return [Fixnum] image width in pixels.
    def width
      @pixels.column_count
    end

  end

end
