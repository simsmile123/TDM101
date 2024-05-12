#Question 1
import pandas as pd
from pathlib import Path
myDF = pd.read_csv("/anvil/projects/tdm/data/noaa/1880.csv", header = None, names =["id", "date", "element_code", "value", "mflag", "qflag", "sflag", "obstime"])
def avg_aggreg_temp(file_location, column_title_list, start_date, end_date, my_element_code = "TAVG" ) -> float:
    myDF = pd.read_csv(file_location, header=None, names=column_title_list)
    myresult = myDF[(myDF['date'] >= start_date) & (myDF['date'] <= end_date) & (myDF['element_code'] == my_element_code)]['value'].mean()
    return myresult
myDF.shape

#Question 2
def avg_aggreg_temp_by_year(range_of_years, column_title_list, my_element_code = "TAVG") -> dict:
    mydict = {}
    for myyear in range_of_years:
        file_location = f'/anvil/projects/tdm/data/noaa/{myyear}.csv'
        myDF = pd.read_csv(file_location, header=None, names=column_title_list)
        myresult = myDF[(myDF['element_code'] == my_element_code)]['value'].mean()
        mydict[myyear] = myresult
    return mydict
avg_aggreg_temp_by_year(range(1880,1884), ["id", "date", "element_code", "value", "mflag", "qflag", "sflag", "obstime"])

#Question 3

def avg_aggreg_temp_by_year_and_month(range_of_years, my_month, column_title_list, my_element_code = "TAVG") -> dict:
    mydict = {}
    for myyear in range_of_years:
        file_location = f'/anvil/projects/tdm/data/noaa/{myyear}.csv'
        myDF = pd.read_csv(file_location, header=None, names=column_title_list)
        myDF['month'] = pd.to_datetime(myDF['date'], format = '%Y%m%d').dt.month
        myresult = myDF[(myDF['element_code'] == my_element_code) & (myDF['month'] == my_month)]['value'].mean()
        mydict[myyear] = myresult
    return mydict
avg_aggreg_temp_by_year_and_month(range(1880,1884), 7, ["id", "date", "element_code", "value", "mflag", "qflag", "sflag", "obstime"])

#Question 4

def most_qflags_year(range_of_years, qflag, column_title_list) -> int:
    max_qflags_year = range_of_years[0]
    max_qflags_count = 0
    
    for myyear in range_of_years:
        file_location = f'/anvil/projects/tdm/data/noaa/{myyear}.csv'
        myDF = pd.read_csv(file_location, header=None, names=column_title_list)
        qflags_count = myDF[(myDF['qflag'] == qflag)].shape[0]
        
        if qflags_count > max_qflags_count:
            max_qflags_count = qflags_count
            max_qflags_year = myyear
    
    return max_qflags_year
#test aspect
range_of_years = range(1880, 1884)
column_title_list = ["id","date","element_code","value","mflag","qflag","sflag","obstime"]  
qflags_to_test = ['D', 'G', 'I', 'K', 'L', 'N', 'O', 'S', 'X']

for qflag in qflags_to_test:
    year_with_most_qflags = most_qflags_year(range_of_years, qflag, column_title_list)
    print(f"Year with most qflags '{qflag}': {year_with_most_qflags}")
    
#Question 5
myDF = pd.read_csv("/anvil/projects/tdm/data/noaa/1880.csv", header = None, names =["id", "date", "element_code", "value", "mflag", "qflag", "sflag", "obstime"])
myDF.head()
def most_values_year(range_of_years, value, column_title_list) -> int:
    '''
    takes in range_of_years, value, column_title_list, and returns the year with the highest value
    '''
    max_value_year = range_of_years[0]
    max_value_count = 0
    
    for myyear in range_of_years:
        file_location = f'/anvil/projects/tdm/data/noaa/{myyear}.csv'
        myDF = pd.read_csv(file_location, header=None, names=column_title_list)
        value_count = myDF[(myDF['value'] == value)].shape[0]
        
        if value_count > max_qflags_count:
            max_value_count = value_count
            max_value_year = myyear
    
    return max_value_year




