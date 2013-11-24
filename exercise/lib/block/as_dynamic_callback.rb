class Server
  PARAM_PATTERN = /:([a-z]+)/

  class Handler
    attr_reader :pattern, :block

    def initialize(server, pattern, block)
      @server = server
      @pattern = pattern
      @block = block
    end

    def handle uri
      match_data = @pattern.match uri
      if match_data
        param = extract_params(match_data)
        @server.add_param(param) if param
        @block.call
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

  def self.draw(&block)
    server = Server.new
    server.instance_eval(&block)
    server
  end

  %w{ get post put }.each do |method|
    define_method(method) do |uri, &block|
      pattern = build_pattern(uri)

      @handlers[method] ||= []
      @handlers[method] << Handler.new(self, pattern, block)
    end
  end

  def not_found(&block)
    @not_found = block
  end

  def initialize()
    @handlers = {}
  end

  def add_param param
    self.params.merge! param
  end

  def recieve(method, uri)
    handlers_for(method).each do |handler|
      response = handler.handle(uri)
      return response unless response.nil?
    end
    @not_found.call
  end

  def handlers_for(method)
    @handlers[method.downcase] || []
  end

  def params
    @params ||= Hash.new
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
end
