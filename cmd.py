import h2o
from h2o.automl import H2OAutoML
import pandas as pd

h2o.init(ip="localhost")

data = pd.read_pickle('/987BF397F533.dataframe')

print(data.shape)

frame = h2o.H2OFrame(data)

print(frame.shape)

x = frame.columns

x.remove("TMP")
x.remove("MAC")
x.remove("TS")
for i in range(0, 48):
    x.remove("TIME%02d" % i)

y = "TMP"

train,test,valid = frame.split_frame(ratios=[.333, .333])

print(train.shape)
print(test.shape)
print(valid.shape)

hour = 60*60

aml_all = H2OAutoML(max_runtime_secs = 24*hour)

aml_all.train(x = x, y = y,
        training_frame = train,
        leaderboard_frame = test,
        validation_frame = valid)

