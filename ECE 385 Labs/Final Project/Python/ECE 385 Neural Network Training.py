#!/usr/bin/env python
# coding: utf-8

# In[8]:


import numpy as np 
import pandas as pd
from sklearn.model_selection import train_test_split
from keras.utils.np_utils import to_categorical
import seaborn as sns
from tensorflow import keras
from keras.models import Sequential
from keras.layers import Dense, Dropout, Flatten, Conv2D, MaxPool2D
from tensorflow.keras.optimizers import RMSprop
from keras.preprocessing.image import ImageDataGenerator
from keras.callbacks import ReduceLROnPlateau


# In[ ]:


#Preparing the dataset
np.random.seed(2)

'load the dataset'
dataset = pd.read_csv("dataset.csv")

"creating label"
y = dataset["label"]

"dropping label"
X = dataset.drop(labels = ["label"], axis = 1)

"deleting dataset to reduce memory usage"
del dataset

'overview of dataset'
g = sns.countplot(y)
y.value_counts()

'Grayscale normalization to reduce the effect of illumination differences.'
X = X / 255.0

'''
reshaping the dataset to fit standard of a 4D tensor of shape [mini-batch size, height = 28px, width = 28px, channels = 1 due to grayscale].
-1 for reshape means unknown (python will figure out this dimension itself by looking at the number of elements left) Batch size in this case
is going to be the number of images. 28x28 is the x and y values of the image. We are essentially reshaping 1D array of pixel values ranging from
0 to 255 into 2D array of size 28x28'
'''
X = X.values.reshape(-1,28,28,1)

'categorical conversion of label. 10 numbers and 4 operations. Converts it to hot bit vectors'
y = to_categorical(y, num_classes = 14)

'90% Training and 10% Validation split'
random_seed = 2
X_train, X_test, y_train, y_tes = train_test_split(X, y, test_size = 0.1 , random_state = random_seed, stratify = y)


# In[ ]:


from tensorflow import keras
from keras.models import Sequential
from keras.layers import Dense, Dropout, Flatten, Conv2D, MaxPool2D
from tensorflow.keras.optimizers import RMSprop
from keras.preprocessing.image import ImageDataGenerator
from keras.callbacks import ReduceLROnPlateau


'creating the instance of the model'
model = Sequential()

'''
adding layers to the model'
First, a set of two Convolutional layers (32 filters and ReLU activation function) to identify the low level image patterns (lines, edges, etc.).
Next, the Max Pooling layer (pooling size of 2 X 2) simply downsamples the filters to reduce computational load, memroy usage and number of parameters.
Finally, a Dropout is used as regularization method. It randomly ignore 25% of the nodes during every training iteration.
filters: Integer, the dimensionality of the output space (i.e. the number of output filters in the convolution).
kernel_size: An integer or tuple/list of 2 integers, specifying the height and width of the 2D convolution window.
"same" results in padding with zeros evenly to the left/right or up/down of the input
input shape is each picture in the 4D kernel - (x, y, channels = 1)
'''
#Layer: 1
model.add(Conv2D(filters = 32, kernel_size = (5,5), padding = "Same", activation = "relu", input_shape = (28, 28, 1)))
model.add(Conv2D(filters = 32, kernel_size = (5,5), padding = "Same", activation = "relu"))
model.add(MaxPool2D(pool_size = (2,2)))
model.add(Dropout(0.25))

'''
A set of two Convolutional layers (64 filters and ReLU activation function) to identify complex patterns that are a combination of lower-level patterns detected by the first layer.
Max Pooling layer (pooling size of 2 X 2) for downsampling.
Dropout for regularization.
'''
#Layer: 2
model.add(Conv2D(filters = 64, kernel_size = (3,3), padding = "Same", activation = "relu"))
model.add(Conv2D(filters = 64, kernel_size = (3,3), padding = "Same", activation = "relu"))
model.add(MaxPool2D(pool_size = (2,2)))
model.add(Dropout(0.25))

'''
First, a Flatten layer is use to convert the final feature maps into a single 1D vector (necessary for Dense layer input).
Next, a fully-connected (Dense) layer that acts as an Artificial Neural Network.
Dropout for regularization.
Finally, another fully-connected (Dense) layers with Softmax activation as the output layer. The softmax function takes the 
elements of the output layer and transforms them into a net output distribution of the probability of each class. The class with the highest probability is taken as the model prediction.
'''
#fully connected layer and output
model.add(Flatten())
model.add(Dense(256, activation = "relu"))
model.add(Dropout(0.25))
model.add(Dense(14, activation = "softmax"))

'''
Set the optimizer and annealer
The loss function measures the error rate between the observed and predicted labels. For this model, categorical_crossentropy is used as th loss function.
Next, the famous RMSprop is used as the optimizer algorithm to iteratively improves various model parameters. RMSprop is also one of the fastest optimizers.
The metric function “accuracy” is used as the score function to evaluate the performance our model.
In order to make the optimizer converge faster and closest to the global minimum of the loss function, the ReduceLROnPlateau function from Keras.callbacks is used as an annealing method of the learning rate (LR).
optimizer = RMSprop(learning_rate = 0.001, rho = 0.9, epsilon = 1e-08, decay=0.0 )
'''
model.compile(optimizer = optimizer, loss = "categorical_crossentropy", metrics = ["accuracy"])

learning_rate_reduction = ReduceLROnPlateau(monitor = "val_accuracy",
                                            patience = 3,
                                            verbose = 1,
                                            factor = 0.5,
                                            min_lr = 0.0001)

'''
'data augmentation
Data augmentation is a set of techniques to artificially increase the amount of data by generating new data points from existing data.
This includes making small changes to data or using deep learning models to generate new data points.
'''
datagen = ImageDataGenerator(
        featurewise_center=False,  # set input mean to 0 over the dataset
        samplewise_center=False,  # set each sample mean to 0
        featurewise_std_normalization=False,  # divide inputs by std of the dataset
        samplewise_std_normalization=False,  # divide each input by its std
        zca_whitening=False,  # apply ZCA whitening
        rotation_range=10,  # randomly rotate images in the range (degrees, 0 to 180)
        zoom_range = 0.1, # Randomly zoom image 
        width_shift_range=0.1,  # randomly shift images horizontally (fraction of total width)
        height_shift_range=0.1,  # randomly shift images vertically (fraction of total height)
        horizontal_flip=False,  # randomly flip images
        vertical_flip=False)  # randomly flip images

datagen.fit(X_train)


'fitting the model'
epochs = 5
batch_size = 86

'history allows us to see the accuracy as well as other things for each epoch'
history = model.fit(
                                datagen.flow(X_train,y_train, batch_size=batch_size),
                                epochs = epochs, #An epoch is an iteration over the entire x and y data provided
                                validation_data = (X_val,y_val), #Data on which to evaluate the loss and any model metrics at the end of each epoch. 
                                verbose = 2, #output
                                steps_per_epoch=X_train.shape[0] // batch_size,  # Total number of steps (batches of samples) before declaring one epoch finished and starting the next epoch.
                                callbacks=[learning_rate_reduction]                            
                              )

'saving the model HDF5 binary data format'
model.save("model.h5")


# In[18]:


#Building and Training CNN Model
from PIL import Image
from itertools import groupby

'loading image'
image = Image.open("testing2.png").convert("L")

'resizing to 28 height pixels'
w = image.size[0]
h = image.size[1]
r = w / h # aspect ratio

'image is resized to a height of 28 px (model input requirement). Keeping the same aspect ratio, the width is adjusted as well.'
new_w = int(r * 28)
new_h = 28
new_image = image.resize((new_w, new_h))

'converting to a numpy array'
new_image_arr = np.array(new_image)

'inverting the image to make background = 0. Black is 0. White is 255'
new_inv_image_arr = 255 - new_image_arr

'rescaling the image'
final_image_arr = new_inv_image_arr / 255.0

'''
splitting image array into individual digit arrays using non zero columns
Now the image array is split into individual element arrays.
This is done by searching the image array for successive non zero columns (non black) and grouping them to form one element array.
These element arrays are all stored in one list. If there are 14 elements in the mathematical expression, the size of the list will be 14.
'''
m = final_image_arr.any(0)
out = [final_image_arr[:,[*g]] for k, g in groupby(np.arange(len(m)), lambda x: m[x] != 0) if k]


'''
iterating through the digit arrays to resize them to match input 
criteria of the model = [mini_batch_size, height, width, channels]
'''
num_of_elements = len(out)
elements_list = []
'''
In order to identify the element using the model, it is important to have the image size of 28px*28px. The height is already 28px.
However, due to the splitting process, the width of each element is not exactly 28px.
Therefore, after the splitting, the width of each element is adjusted to 28 px. by adding zero value columns (filler columns) to the element arrays.
'''
for x in range(0, num_of_elements):
    img = out[x]
    
    #adding 0 value columns as fillers
    width = img.shape[1]
    filler = (final_image_arr.shape[0] - width) / 2
    
    if filler.is_integer() == False:    #odd number of filler columns
        filler_l = int(filler)
        filler_r = int(filler) + 1
    else:                               #even number of filler columns
        filler_l = int(filler)
        filler_r = int(filler)
    
    arr_l = np.zeros((final_image_arr.shape[0], filler_l)) #left fillers
    arr_r = np.zeros((final_image_arr.shape[0], filler_r)) #right fillers
    
    #concatinating the left and right fillers
    help_ = np.concatenate((arr_l, img), axis= 1)
    element_arr = np.concatenate((help_, arr_r), axis= 1)
    
    element_arr.resize(28, 28, 1) #resize array 2d to 3d

    #storing all elements in a list
    elements_list.append(element_arr)


elements_array = np.array(elements_list)

'the elements list is converted back into an array of shape (14, 28, 28, 1) to fit the model input requirements of a 4D Tensor'
elements_array = elements_array.reshape(-1, 28, 28, 1)

'predicting using the model'
model = keras.models.load_model("model.h5")
elements_pred =  model.predict(elements_array)

'The class with the highest probability is chosen.'
elements_pred = np.argmax(elements_pred, axis = 1)


# In[19]:


#Creating the math calculator
def math_expression_generator(arr):
    op = {
              10,   # = "/"
              11,   # = "+"
              12,   # = "-"
              13    # = "*"
                  }   
    
    'creating a list separating all elements'
    'm_exp would become [9, 8], 10, [7, 6], 13, [5, 4], 11, [3, 2], 12, [1, 0]] --> 98 / 76 * 54 + 32 - 10 = 91.63'
    m_exp = []
    temp = []
    for item in arr:
        if item not in op:
            temp.append(item)
        else:
            m_exp.append(temp)
            m_exp.append(item)
            temp = []
    if temp:
        m_exp.append(temp)
    
    'converting the elements to numbers and operators'
    'so things like [9, 8] in m_exp are converted to the number 98'
    i = 0
    num = 0
    for item in m_exp:
        if type(item) == list:
            if not item:
                m_exp[i] = ""
                i = i + 1
            else:
                num_len = len(item)
                for digit in item:
                    num_len = num_len - 1
                    num = num + ((10 ** num_len) * digit)
                m_exp[i] = str(num)
                num = 0
                i = i + 1
        else:
            m_exp[i] = str(item)
            m_exp[i] = m_exp[i].replace("10","/")
            m_exp[i] = m_exp[i].replace("11","+")
            m_exp[i] = m_exp[i].replace("12","-")
            m_exp[i] = m_exp[i].replace("13","*")
            
            i = i + 1
    
    
    'joining the list of strings to create the mathematical expression'
    separator = ' '
    m_exp_str = separator.join(m_exp)
    
    return (m_exp_str)

'creating the mathematical expression'
m_exp_str = math_expression_generator(elements_pred)

'calculating the mathematical expression using eval()'
while True:
    try:
        answer = eval(m_exp_str)    #evaluating the answer
        answer = round(answer, 2)
        equation  = m_exp_str + " = " + str(answer)
        print(equation)   #printing the equation
        break

    except SyntaxError:
        print("Invalid predicted expression!!")
        print("Following is the predicted expression:")
        print(m_exp_str)
        break


# In[ ]:


#Model update
'''
What makes Machine learning algorithms so powerful is its ability to learn from its mistakes. In order to do that the model needs to be retrained with correct information.'
When there is a false prediction, the above code asks for the correct mathematical expression from the user. It then compares the predicted with the correct expression and identifies the elements that are wrongly predicted.
The code then trains the model from its second hidden layer till its output layer using the correct data (first hidden layer is not trained).
The updated model is saved and can be used later to make improved predictions.
'''
def model_update(X, y, model):
    
    from tensorflow.keras.optimizers import RMSprop
    from keras.utils.np_utils import to_categorical
    from keras.preprocessing.image import ImageDataGenerator
      
    y = to_categorical(y, num_classes = 14)
    
    datagen = ImageDataGenerator(
        featurewise_center=False,  # set input mean to 0 over the dataset
        samplewise_center=False,  # set each sample mean to 0
        featurewise_std_normalization=False,  # divide inputs by std of the dataset
        samplewise_std_normalization=False,  # divide each input by its std
        zca_whitening=False,  # apply ZCA whitening
        rotation_range=10,  # randomly rotate images in the range (degrees, 0 to 180)
        zoom_range = 0.1, # Randomly zoom image 
        width_shift_range=0.1,  # randomly shift images horizontally (fraction of total width)
        height_shift_range=0.1,  # randomly shift images vertically (fraction of total height)
        horizontal_flip=False,  # randomly flip images
        vertical_flip=False)  # randomly flip images

    datagen.fit(X)

    #freezing layers 0 to 4
    for l in range(0, 5):
        model.layers[l].trainable = False

    optimizer = RMSprop(lr = 0.0001, rho = 0.9, epsilon = 1e-08, decay=0.0 )
    model.compile(optimizer = optimizer, loss = "categorical_crossentropy", metrics = ["accuracy"])
        
    history = model.fit(
                            datagen.flow(X,y, batch_size = 1),
                            epochs = 50,
                            verbose = 1
                        )
    
    'saving the model'
    model.save("updated_model.h5") 
    
    print("Model has been updated!!")
#++++++++++++++++++++++++++++++++++++++++++++++++++++++



'taking user feedback regarding prediction'
feedback = input("Was the expression correctly predicted? (y/n): ")

'if no then, asking user for correct expression'
if feedback == "n":
    corr_ans_str = str(input("The correct expression is: "))
    corr_ans_str = corr_ans_str.replace(" ", "")
    
    def feedback_conversion(correct_ans_str):
        return [char for char in correct_ans_str]
    
    corr_ans_list = feedback_conversion(corr_ans_str)
    dic = {"/":"10", "+": "11", "-": "12", "*": "13"}  
    corr_ans_list = [dic.get(n, n) for n in corr_ans_list]
    corr_ans_arr= np.array(list(map(int, corr_ans_list)))
    print(corr_ans_arr.shape)
    
    'comparing the expressions and getting the indexes of the wrong predictioned elements'
    wrong_pred_indices = []
    
    for i in range(len(corr_ans_arr)):
        if corr_ans_arr[i] == elements_pred[i]:
            pass
        else:
            wrong_pred_indices.append(i)
    
    'picking up the wrongly predicted elements'
    X = elements_array[[wrong_pred_indices]]
    
    'reshaping to fit model input standards'
    if len(X.shape) == 3:
        X = X.reshape(-1, 28, 28, 1)
    else:
        pass
    
    'the correct answers as labels'
    y = corr_ans_arr[[wrong_pred_indices]]
    
    'updating the model'
    model_update(X, y, model)    
    
    
else:
    'if expression is correctly predicted'
    pass

