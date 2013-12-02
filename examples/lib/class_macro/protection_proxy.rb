module ProtectionProxy
  def role(role_name)
    @current_writable_fields = []
    yield
    writable_fileds[role_name] = @current_writable_fields
  end

  def writable(*names)
    names.each do |name|
      @current_writable_fields << name
    end
  end

  def find_proxy(object, role)
    Proxy.new(object, writable_fileds[role])
  end

  private
  def writable_fileds
    @writable_fileds ||= {}
  end

end

class Proxy

  def initialize(object, writable_fileds)
    @object = object
    @writable_fileds = writable_fileds
  end

  def method_missing(sym, *args, &block)
    method_name = sym.to_s
    if ! method_name.end_with?("=") || @writable_fileds.include?(field_name_from(method_name))
      @object.send(sym, *args, &block)
    end
  end

  private

  def field_name_from method_name
    method_name[0...-1].to_sym
  end
end
