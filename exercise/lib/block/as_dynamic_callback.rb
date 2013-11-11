class Server
  def self.draw(&block)
    Server.new
  end

  def initialize()
    @handlers = {}
  end

  def recieve(method, uri)
    "#{method} #{uri}"
  end
end
