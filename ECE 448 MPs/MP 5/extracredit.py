import torch, random, math, json
import numpy as np
from extracredit_embedding import ChessDataset, initialize_weights

DTYPE=torch.float32
DEVICE=torch.device("cpu")

###########################################################################################
def trainmodel():
    # Well, you might want to create a model a little better than this...
    model = torch.nn.Sequential(torch.nn.Flatten(), 
                                torch.nn.Linear(in_features=8 * 8 * 15, out_features=512),
                                torch.nn.ReLU(), 
                                torch.nn.Linear(in_features=512, out_features=1))

    # ... and you might want to put some code here to train your model:
    trainset = ChessDataset(filename='extracredit_train.txt')
    trainloader = torch.utils.data.DataLoader(trainset, batch_size=1000, shuffle=True)
    optimizer = torch.optim.Adam(model.parameters(), lr=1e-3)
    loss_fn = torch.nn.L1Loss()
    model.train()
    for epoch in range(4000):
        for x, y in trainloader:
            loss = loss_fn(model.forward(x), y)
            optimizer.zero_grad()
            loss.backward()
            optimizer.step()
    # ... after which, you should save it as "model.pkl":
    torch.save(model, 'model.pkl')


###########################################################################################
if __name__=="__main__":
    trainmodel()