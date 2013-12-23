class Proxy
  def initialize target
    @calls = []
    @target = target
  end

  def messages
    @calles.uniq
  end
end
