import pickle;
import numpy;
import gzip;

f = gzip.open('mnist.pkl.gz', 'rb')
training_data, validation_data, test_data = pickle.load(f, encoding="latin1")

wf = open("trainingdata.data", 'w')
for dataIndex in range(training_data[0].__len__()):
    x = training_data[0][dataIndex].tolist();
    y = training_data[1][dataIndex].tolist();
    for pixel in x:
        wf.write(str(pixel));
        wf.write(" ");
    wf.write(str(y));
    wf.write("\n\r")
wf.close();

wf = open("validationdata.data", 'w')
for dataIndex in range(validation_data[0].__len__()):
    x = training_data[0][dataIndex].tolist();
    y = training_data[1][dataIndex].tolist();
    for pixel in x:
        wf.write(str(pixel));
        wf.write(" ");
    wf.write(str(y));
    wf.write("\n\r")
wf.close()

wf = open("testdata.data", 'w')
for dataIndex in range(test_data[0].__len__()):
    x = training_data[0][dataIndex].tolist();
    y = training_data[1][dataIndex].tolist();
    for pixel in x:
        wf.write(str(pixel));
        wf.write(" ");
    wf.write(str(y));
    wf.write("\n\r")
wf.close()

f.close()
