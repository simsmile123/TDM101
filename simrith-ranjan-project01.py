# Question 2
print("Hello World!")
# Question 3
num1 = int(input("Enter an integer: "))
num2 = int(input("Enter an integer: "))
sum = num1 + num2
print("The sum of the two numbers is:", sum)
# Question 4
myfruits = []
for i in range(1,6):
    fruit = input("Enter name of fruit ")
    myfruits.append(fruit)
print(myfruits)
# Question 5
import pandas as pd
forest = pd.read_csv("/anvil/projects/tdm/data/forest/ENTIRE_COUNTY.csv")
forest.info()
forest.shape
forest.size
forest.info