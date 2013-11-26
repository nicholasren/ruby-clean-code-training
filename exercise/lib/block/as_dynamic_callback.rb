class Server
  PARAM_PATTERN = /:([a-z]+)/

  def self.draw(&block)
    server = Server.new
    server.instance_eval(&block)
    server
  end

  def initialize
    @handlers = []
  end

  %w{ get post put }.each do |method|
    define_method(method) do |uri, &block|
      @handlers << Handler.new(method, build_pattern(uri), block)
    end
  end

  def not_found(&block)
    @not_found = block
  end

  def recieve(method, uri)
    @handlers.each do |handler|
      response = handler.handle(method, uri)
      return response unless response.nil?
    end
    @not_found.call
  end

  private
  def build_pattern(uri)
    if PARAM_PATTERN =~ uri
      param_name = $~.to_a.last
      Regexp.new(uri.gsub(PARAM_PATTERN, "(?<#{param_name}>[^/]+)"))
    else
      Regexp.new(uri)
    end
  end

  class Handler
    attr_reader :pattern, :block, :params

    def initialize(method, pattern, block)
      @method = method.downcase
      @pattern = pattern
      @block = block
    end

    def handle(method, uri)
      return nil unless method_matched?(method)
      if @pattern =~ uri
        #extract params from uri and save them into this handler
        @params = extract_params($~)

        #evaluating block on this handler
        self.instance_eval(&@block)
      end
    end

    private
    def method_matched?(method)
      method.downcase == @method
    end

    def extract_params(match_data)
      name = match_data.names.last
      value = match_data.to_a.last
      if name && value
        {name.to_sym => value}
      end
    end

  end
end
