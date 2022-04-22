from RPA.Excel.Files import Files
from RPA.Tables import Tables


class Orders:
    def get_orders(self, excel):
        files = Files()
        workbook = files.open_workbook(excel)
        rows = workbook.read_worksheet(header=True)

        tables = Tables()
        table = tables.create_table(rows)
        tables.filter_empty_rows(table)

        orders = []
        for row in table:
            #first_name, last_name = row["Name"].split()
            order = {
                #"item": row["Item"],
                #"zip": int(row["Zip"]),
                "first_name": "uname",
                "last_name": "password"
            }
            orders.append(order)

        return orders