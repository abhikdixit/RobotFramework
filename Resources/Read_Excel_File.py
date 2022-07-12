from RPA.Excel.Files import Files
from RPA.Tables import Tables


# excel="testdata/OrangeData.xlsx"
def get_orders(excel):
    files = Files()
    workbook = files.open_workbook(excel)
    rows = workbook.read_worksheet(header=True)

    tables = Tables()
    table = tables.create_table(rows)
    tables.filter_empty_rows(table)

    orders = []
    for row in table:
        order = {
            "username": row["uname"],
            "pass": row["password"]
        }
        orders.append(order)

    return orders


x = get_orders("D:\\F Drive\\RobotFramework_NewVersion\\testdata\\OrangeData.xlsx")
print(x)
