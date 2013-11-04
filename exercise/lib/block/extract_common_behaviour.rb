require "socket"

class Client
  def initialize(ip="127.0.0.1",port=3333)
    @ip, @port = ip, port
  end

  def send_message(msg)
    socket = TCPSocket.new(@ip,@port)
    socket.puts(msg)
  ensure
    socket.close
  end

  def receive_message
    socket = TCPSocket.new(@ip,@port)
    response = socket.gets
  ensure
    socket.close
  end
end
