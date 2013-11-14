class Collection
  def self.all?(collection)
    collection.reduce(true){ |acc, x| acc && yield(x) }
  end
end
