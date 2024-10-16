import sqlite3
import os
import csv
import re
from contextlib import contextmanager
from datetime import datetime


@contextmanager
def change_dir(destination):
    try:
        cwd = os.getcwd()
        os.chdir(destination)
        yield
    finally:
        os.chdir(cwd)


class Create_Database_from_CSV:
"""
 - Inserts Data from CSV-file
 - Fixes the problems with number-format data:
    makes integer-number from string with numbers (without other symbols)
    makes float-number from string with numbers with '.' or ',' correct format -> "12.234"
    fixes datetime issues, convert "1/12/2012" and "1.12.2012" to "2012-12-01"  
"""

    def __init__(self, file_name, db_name):
        self.connection = None
        self.sql_cursor = None

        self.file_name = file_name
        self.db_name = db_name

        self.create_sql_table_from_CSV()

    def fix_datetimeformat(self, f):
        date_objekt = None
        date_formatted = ''
        time_f = ''
        f = f.strip()

        s = f.find(' ')
        if s > 0:
            date_f = f[:s]
            time_f = f[(s + 1):]
            s = time_f.find(".")
            if s > 0:
                time_f = time_f[:-(len(time_f) - s)]
        else:
            date_f = f

        if not bool(re.match('[0-9:]+$', date_f)):

            if bool(re.match('[0-9.]+$', date_f)) and f.count('.') == 2:  # fix dateformat with dots
                date_objekt = datetime.strptime(date_f, '%d.%m.%Y')
                date_formatted = date_objekt.strftime('%Y-%m-%d')

            elif bool(re.match('[0-9/]+$', date_f)):                      # fix dateformat with slash
                date_objekt = datetime.strptime(date_f, '%d/%m/%Y')
                date_formatted = date_objekt.strftime('%Y-%m-%d')

        if date_formatted == '':
            date_formatted = date_f

        if len(time_f) > 0:
            date_formatted += ' ' + time_f

        return date_formatted

    def fix_dataformat(self, f):                                        # check and fix dataformat
        d = None
        f = f.strip()
        try:
            if bool(re.match('[0-9]+$',f)):                             # check if it's an integer number
                d = int(f)
            elif bool(re.match('[0-9,.]+$',f)) and f.count('.') < 2 \
                    and f.count(',') < 2:                               # check if it's a float number
                d = float(f.replace(",","."))

            elif bool(re.match('[0-9./: ]+$', f)):                      # check if it's a datetime
                d = self.fix_datetimeformat(f)
            else:
                d = f

        except Exception as e:
            print(e)
            d = str(f)
        finally:
            return d

    def sql_execute(self, sql_command):
        self.sql_cursor = self.connection.cursor()
        try:
            self.sql_cursor.execute(sql_command)
            self.connection.commit()
        except Exception as e:
            print(sql_command, e)
            self.connection.rollback()

    def create_sql_table_from_CSV (self):
        table_name = os.path.splitext(self.file_name)[0]
        field_names = []

        with open(self.file_name, newline="", encoding='utf-8-sig') as csv_file:
            reader = csv.reader(csv_file, delimiter=";")
            title_string = next(reader)  # read header

            for field in title_string:
                field_names.append(field.strip())

    #------------------------------------Create Table------------------------------------------
            self.connection = sqlite3.connect(self.db_name)

            # sql_drop_table = f"DROP TABLE IF EXISTS {table_name};"
            # self.sql_execute(sql_drop_table)
            #
            table_fields = str(field_names).strip('[]')
            # create_table_all_fields = f"{table_name}_ID INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT, " \
            #                           + table_fields
            #
            # sql_create_table = f"CREATE TABLE {table_name} ({create_table_all_fields});"

            # self.sql_execute(sql_create_table)
            # print(f"Table \'{table_name}\' created")

    # -----------------------------------Insert Data ----------------------------------------------
    #         print(f"Wait a minute, inserting data into: \'{table_name}\'")

            sql_delete_old_data = f"DELETE FROM {table_name};"
            self.sql_execute(sql_delete_old_data)

            for row in reader:                                  # read rows from table
                daten = []
                for f in row:
                    daten.append(self.fix_dataformat(f))

                insert_row_data = f"INSERT INTO {table_name} ( {table_fields} ) "
                insert_row_data += f"VALUES ( {str(daten).strip('[]')} );"

                self.sql_execute(insert_row_data)

            print(f"Table \'{table_name}\' in \'{self.db_name}\' is ready to use!\n")


pfad = "C:\\DE_Projekt\\Source_data\\"
db_name = 'Zoo.db'

with change_dir(pfad):
    if __name__ == "__main__":

        list_of_files = []
        for file in os.listdir(os.curdir):
            _, fext = os.path.splitext(file)
            if fext == ".csv":
                list_of_files.append(file)

        for file_name in list_of_files:
            Create_Database_from_CSV(file_name, db_name)

        print("Number of files: ", len(list_of_files))

        # Create_Database_from_CSV('Krankheitsfall.csv', db_name)

