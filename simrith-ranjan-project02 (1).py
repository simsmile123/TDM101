# Question 1
mydata = [
    ("Simrith", 18, "Computer Science"),
    ("Sanketh", 17, "Pyschology"),
    ("Charlie", 22, "Engineering"),
    ("Kushal", 22, "Bowling"),
    ("Hannah", 21, "Biology"),
    ("Mckenzie", 20, "Psychology")
]

import pandas as pd
studentDF = pd.DataFrame(data=mydata)
print(studentDF)

print(studentDF.iloc[1])

# Question 2
import pandas as pd
myDF = pd.read_csv("/anvil/projects/tdm/data/craigslist/vehicles.csv")
myDF.head()
myDF.tail()


# Question 3

myDF.shape
myDF.columns.tolist()

# Question 4
sum(myDF['price'] > 6000) # you could also do like sum(myDF['price'] > 6000 == True)
sum(myDF['state'] == "in")
sum(myDF['state'] == "tx")
myDF['region'].unique()
len(myDF['region'].unique())

# Question 5

import matplotlib.pyplot as plt
lower_than_six = myDF[myDF['price'] < 6000]
barplot = lower_than_six.groupby('state').size()
barplot.plot(kind = 'bar', figsize = (20, 10))
plt.xlabel("States")
plt.ylabel("Number of cars under $6000")
for i, count in enumerate(barplot):
    plt.annotate(str(count), xy=(i, count), ha='center', va='bottom')


