class Table {
  private List<Row> rows = new ArrayList<Row>();
  public void addRow(Row row){
    rows.add(row);
  }
}

calss Row {
  private String tag;
  private List<Cell> cells = new ArrayList<Cell>();

  public Row(String tag){
    this.tag = tag;
  }

  public addCell(Cell cell) {
    this.cells.add(cell);
  }
}

class Cell {
  private String text;
  public Cell(String text) {
    this.text = text;
  }
}

class Main {
  public static void main( String[] args ) {
    Table table = new Table();
    Row header = new Row("th");
    Cell cell1 = new Cell("Name");
    Cell cell2 = new Cell("Age");
    Cell cell3 = new Cell("Gender");

    row.addCell(cell1);
    row.addCell(cell2);
    row.addCell(cell3);
    table.addRow(header)

    Row data = new Row("td");
    Cell cell4 = new Cell("Doudou");
    Cell cell5 = new Cell("3");
    Cell cell6 = new Cell("Female");
    data.addCell(cell4);
    data.addCell(cell5);
    data.addCell(cell6);
    table.addRow(data);
  }
}
