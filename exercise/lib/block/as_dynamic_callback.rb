class Server
  def self.generate(&block)
    server = Server.new
    server.instance_eval(&block)
    server
  end

  def initialize()
    @handlers = {}
  end

  def handle(pattern, &block)
    @handlers[pattern] = block
  end

  def recieve(message)
    @handlers.each do |pattern,block|
      if match = message.match(pattern)
        return block.call(match)
      end
    end
    return nil
  end
end
