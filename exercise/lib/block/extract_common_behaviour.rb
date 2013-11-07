require "socket"

class Client
  def initialize(ip="127.0.0.1",port=3333)
    @ip, @port = ip, port
  end

  def connect(&block)
    socket = TCPSocket.new(@ip,@port)
    yield socket
  ensure
    socket.close
  end

  def send_message(msg)
    connect do |socket|
      socket.puts(msg)
    end
  end

  def receive_message
    connect do |socket|
      socket.gets
    end
  end
end
