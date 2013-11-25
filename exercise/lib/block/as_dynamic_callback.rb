class Server
  PARAM_PATTERN = /:([a-z]+)/

  def self.draw(&block)
    server = Server.new
    server.instance_eval(&block)
    server
  end

  def initialize
    @handlers = {}
  end

  %w{ get post put }.each do |method|
    define_method(method) do |uri, &block|
      handlers_for(method) << Handler.new(build_pattern(uri), block)
    end
  end

  def not_found(&block)
    @not_found = block
  end

  def recieve(method, uri)
    handlers_for(method).each do |handler|
      response = handler.handle(uri)
      return response unless response.nil?
    end
    @not_found.call
  end

  private
  def handlers_for(method)
    @handlers[method.downcase] ||= []
  end

  def build_pattern(uri)
    match_data = uri.match PARAM_PATTERN
    if match_data
      param_name = match_data.to_a.last
      Regexp.new(uri.gsub(PARAM_PATTERN, "(?<#{param_name}>[^/]+)"))
    else
      Regexp.new(uri)
    end
  end

  class Handler
    attr_reader :pattern, :block, :params

    def initialize(pattern, block)
      @pattern = pattern
      @block = block
    end

    def handle uri
      match_data = @pattern.match uri
      if match_data
        @params = extract_params(match_data)
        self.instance_eval(&@block)
      end
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
