class Table
  def self.generate(&block)
    table = Table.new
    table.instance_eval(&block)
    table
  end

  def initialize
    @cells = []
  end

  def row(&block)
    @cells << []
    block.call
  end

  def cell text
    @cells.last << text
  end

  def as_printable_string
    @cells.reduce(""){ |all, row| all + row.join(',') + "\n"}
  end

end
