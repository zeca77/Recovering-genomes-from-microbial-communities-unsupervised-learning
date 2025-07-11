import pandas as pd

from chameleon import *

if __name__ == "__main__":
    # get a set of data points
    df = pd.read_csv('./datasets/Aggregation.csv', sep=' ',
                     header=None)

    # returns a pands.dataframe of cluster
    res = cluster(df, 7, knn=20, m=40, alpha=2.0, plot=False)

