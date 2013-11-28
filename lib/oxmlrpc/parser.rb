module OXMLRPC
  class Parser < ::Ox::Sax

    attr_reader :rpc_method, :params

    def self.parse(xml)
      parser = self.new
      Ox.sax_parse(parser, StringIO.new(xml))
      parser
    end

    def initialize
      @elements = []
      @rpc_method = nil
      @params = []
      @array_mode = false
      @struct_mode = false
    end

    def start_element(name)
      @elements << name
      
      if :array == name
        @array_mode = true
        @params << Array.new
      end

      if :struct == name
        @struct_mode = true
        @params << Hash.new
      end
    end

    def end_element(name)
      @array_mode = false if :array == name 
      @struct_mode = false if :struct == name 
      
      raise "Invalid XML" unless @elements.pop == name
    end

    def text(value)
      @rpc_method = value if :methodName == @elements.last
      @params.last[value] = nil if :name == @elements.last && @struct_mode
      
      add_to_params value == 1 || value == "1"  if :boolean == @elements.last
      add_to_params value                       if [:value, :string].include?(@elements.last)
      add_to_params Integer(value)              if [:int, :i4].include?(@elements.last)
      add_to_params Float(value)                if :double == @elements.last
      add_to_params Time.parse(value)           if :'dateTime.iso8601' == @elements.last
    end

    def add_to_params(value)
      if @array_mode
        @params.last << value
      elsif @struct_mode
        @params.last[@params.last.keys.last] = value
      else
        @params << value
      end
    end
  end
end
