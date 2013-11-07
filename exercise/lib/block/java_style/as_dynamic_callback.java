class Server {
  private Map<Pattern, Callback>  handlers = new HashMap<Pattern, Callback>();

  public void handle(Pattern pattern, Callabck callback)
    this.handlers.put(pattern, callback)
  end

  public Object recieve(message)
    for(Entry<Pattern, Callback> entry : handlers) {
      Pattern pattern = entry.getKey();
      if (pattern.matcher(message).matches()) {
        return entry.getValue().call();
      }
    }
    return null;
}

class Runner {
  public static void main(String[] args) {
    Server server = new Server();
    server.handle(Pattern.compile("/hello/i"), new Callback() {
      public Object call() {
        return "received hello"
      }
    });

    server.handle(Pattern.compile("/play/i"), new Callback() {
      public Object call() {
        return "I'm a bad man"
      }
    });

    //...

    server.receive("hello") // expected "received hello"
    server.receive("play") // expected "I'm a bad man"

  }
}
