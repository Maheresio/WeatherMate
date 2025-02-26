import pickle
import numpy as np

#  Load the model from the pickle file
file_path = "random_forest_model.pkl" # put here the path of the pkl file 
with open(file_path, 'rb') as file:
    model = pickle.load(file)


sample_features = [0, 1, 0, 1, 1]  

#  Convert the sample features to a 2D array 
sample_features = np.array(sample_features).reshape(1, -1)

#  Predict using the loaded model
prediction = model.predict(sample_features)

#  Output the prediction
print(f'Prediction: {prediction}')
