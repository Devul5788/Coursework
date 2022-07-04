import gym
import numpy as np
import torch
from torch import nn
import torch.optim as optim

import utils
from policies import QPolicy

# Modified by Mohit Goyal (mohit@illinois.edu) on 04/20/2022

def make_dqn(statesize, actionsize):
    """
    Create a nn.Module instance for the q leanring model.

    @param statesize: dimension of the input continuous state space.
    @param actionsize: dimension of the descrete action space.

    @return model: nn.Module instance
    """

    return nn.Sequential(nn.Linear(statesize, 100), nn.ReLU(), nn.Linear(100, 100), nn.ReLU(), nn.Linear(100, actionsize))


class DQNPolicy(QPolicy):
    """
    Function approximation via a deep network
    """

    def __init__(self, model, statesize, actionsize, lr, gamma):
        """
        Inititalize the dqn policy

        @param model: the nn.Module instance returned by make_dqn
        @param statesize: dimension of the input continuous state space.
        @param actionsize: dimension of the descrete action space.
        @param lr: learning rate 
        @param gamma: discount factor
        """
        super().__init__(statesize, actionsize, lr, gamma)
        self.statesize = statesize
        self.actionsize = actionsize
        self.lr = lr
        self.gamma = gamma 
        self.loss_fn = torch.nn.MSELoss()

        if model is None:
            # buckets is 1x1x1x1, action size is 2. This syntax makes a model of size 1x1x1x1x2
            self.model = np.zeros(self.buckets + (actionsize,))
        else:
            self.model = model

        # self.model = make_dqn(statesize, actionsize)
        self.optimizer = torch.optim.Adam(self.model.parameters(), lr)

    def qvals(self, state):
        """
        Returns the q values for the states.

        @param state: the state
        
        @return qvals: the q values for the state for each action. 
        """
        self.model.eval()
        with torch.no_grad():
            states = torch.from_numpy(state).type(torch.FloatTensor)
            qvals = self.model(states)
        return qvals.numpy()

    def td_step(self, state, action, reward, next_state, done):
        """
        One step TD update to the model

        @param state: the current state
        @param action: the action
        @param reward: the reward of taking the action at the current state
        @param next_state: the next state after taking the action at the
            current state
        @param done: true if episode has terminated, false otherwise
        @return loss: total loss the at this time step
        """
        #discritizing current and next states
        discrete_state = torch.from_numpy(state).type(torch.FloatTensor)
        next_discrete_state = torch.from_numpy(next_state).type(torch.FloatTensor)
        
        #  target=r+γ⋅maxa′Q(s′,a′) if the state is not terminal and target=r otherwise. Note that target is Qlocal
        if (done == False):
            target = reward + self.gamma * torch.max(self.model(next_discrete_state))
        else:
            target = torch.tensor(reward)
    
        loss = self.loss_fn(self.model(discrete_state)[action], target)
        self.optimizer.zero_grad()
        loss.backward()
        self.optimizer.step()
        return loss.item()

    def save(self, outpath):
        """
        saves the model at the specified outpath
        """        
        torch.save(self.model, outpath)


if __name__ == '__main__':
    args = utils.hyperparameters()

    env = gym.make('CartPole-v1')
    env.reset(seed=42) # seed the environment
    np.random.seed(42) # seed numpy
    import random
    random.seed(42)
    torch.manual_seed(0) # seed torch
    torch.use_deterministic_algorithms(True) # use deterministic algorithms

    statesize = env.observation_space.shape[0]
    actionsize = env.action_space.n

    policy = DQNPolicy(make_dqn(statesize, actionsize), statesize, actionsize, lr=args.lr, gamma=args.gamma)

    utils.qlearn(env, policy, args)

    torch.save(policy.model, 'dqn.model')
