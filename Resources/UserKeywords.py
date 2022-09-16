from robot.api.deco import keyword
import pandas as pd


@keyword("Concatenate")
def concatenate_two_values(value1, value2):
    return value1 + " " + value2


@keyword("Panda Table")
def read_webtable_using_panda(webtable_value):
    df = pd.read_html(webtable_value)
    print(df)
    df = df[-1]
    df.to_csv('table.csv')
    data = pd.read_csv("table.csv")
    # Converting a specific Dataframe
    # column to list using Series.tolist()
    Name_list = data["Name"].tolist()
    return Name_list


@keyword("Panda CommonFunction")
def read_webtable_using_panda(webtable_value, colname):
    df = pd.read_html(webtable_value)
    print(df)
    df = df[-1]
    #df.to_csv('table.csv')
    df.to_excel('table.xls')
    #data = pd.read_csv("table.csv")
    data = pd.read_excel('table.xls')
    # Converting a specific Dataframe
    # column to list using Series.tolist()
    col_list = data[colname].tolist()
    return col_list

@keyword("Create Token")
def create_token(token_value):
    df = pd.read_html(token_value)
    print(df)
    df = df[-1]
    df.to_csv('table.csv')
    data = pd.read_csv("table.csv")
    # Converting a specific Dataframe
    # column to list using Series.tolist()
    token = data["Name"].tolist()
    return token