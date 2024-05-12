#Question 2
import socket
print(socket.gethostname())

#Question 3
import pandas as pd
df = pd.read_csv('/anvil/projects/tdm/data/flights/subset/1991.csv')
df[df["Month"]==12].head() # see information about a few of the flights from December 1991

#Question 4
1000*256*1000000000

