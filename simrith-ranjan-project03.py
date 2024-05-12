#Question 1

import pandas as pd
from pathlib import Path
Path("/anvil/projects/tdm/data/noaa/1750.csv")
myfiles=[Path(f'/anvil/projects/tdm/data/noaa/{year}.csv') for year in range(1880, 1884)]
print(myfiles)

#Question 2
#2a
file = myfiles[0]
with open(file,"r") as f:
    mycount = 0
    for line in f:
        mycount += 1
print(f'There are {mycount} records in the file called {file}')
total_count = 0
#2b
file_counter = 0
for file in myfiles: 
    with open(file,"r") as f:
        for line in f:
            total_count+= 1
    #print(f'There are {mycount} records in the file called {file}')
    file_counter+=1;
print(f'This the total count of all the records in all the years: {total_count} in the {file_counter} files altogether.')

#Question 3

myDF = pd.read_csv(myfiles[0])
myDF.columns.values.tolist()
print(myDF.tail()) #missing values

mysecondDF = pd.read_csv(myfiles[0], header = None)

print("Column Names:", mysecondDF.columns)

myfiles=[]
for year in range (1880, 1884):
    file= Path(f'/anvil/projects/tdm/data/noaa/{year}.csv')
    myfiles.append(file)
new_myDF = []

for files in myfiles:
    df = pd.read_csv(file, header = None, names = ["id","date","element_code","value","mflag","qflag","sflag","obstime"])
    new_myDF.append(df)
    
for i, df in enumerate(new_myDF):
    print(f"column names of each of the four data frames in new_DF {i+1} (year{myfiles[i].stem}):{df.columns}")
    

#Question 4




#Question 5

count = 0
for file in myfiles:
    for myDF in pd.read_csv(file,names=["id","date","element_code","value","mflag","qflag","sflag","obstime"],chunksize =10000):
        count += len(myDF[myDF['element_code'] == 'SNOW'])

print(count)

count = 0
for file in myfiles:
    for myDF in pd.read_csv(file,names=["id","date","element_code","value","mflag","qflag","sflag","obstime"],chunksize =10000):
        for index, row in myDF.iterrows():
            if row['element_code'] == 'SNOW':
                count += 1

print(count)