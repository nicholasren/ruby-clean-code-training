class Server
  def self.draw(&block)
    server = Server.new
    server.instance_eval(&block)
    server
  end

  %w{ get post put }.each do |method|
    define_method(method) do |uri, &block|
      @handlers[method] ||= {}
      @handlers[method][uri] = block
    end
  end

  def not_found(&block)
    @not_found = block
  end


  def initialize()
    @handlers = {}
  end

  def recieve(method, uri)
    http_method = method.downcase

    if @handlers[http_method]
      block = @handlers[http_method][uri]
      if block
        block.call
      else
        @not_found.call
      end
    else
      @not_found.call
    end
  end
end
