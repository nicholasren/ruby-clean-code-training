require "socket"

class Client {
  private String ip;
  private Integer port;

  public Client(String ip, Integer port) {
    this.ip = ip;
    this.port = port;
  }

  public void sendMessage(String msg) {
    TCPSocket socket = TCPSocket.new(this.ip, this.port);
    try {
      socket.puts(msg);
    } finally {
      socket.close();
    }
  }

  public String receiveMessage {
    TCPSocket socket = TCPSocket.new(this.ip, this.port);
    try {
      return socket.gets();
    } finally {
      socket.close();
    }
  }
}
