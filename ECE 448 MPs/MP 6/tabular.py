import math

import gym
import numpy as np
import torch

import utils
from policies import QPolicy

# Modified by Mohit Goyal (mohit@illinois.edu) on 04/20/2022

class TabQPolicy(QPolicy):
    def __init__(self, env, buckets, actionsize, lr, gamma, model=None):
        """
        Inititalize the tabular q policy

        @param env: the gym environment
        @param buckets: specifies the discretization of the continuous state space for each dimension
        @param actionsize: dimension of the descrete action space.
        @param lr: learning rate for the model update 
        @param gamma: discount factor
        @param model (optional): Load a saved table of Q-values for each state-action
            model = np.zeros(self.buckets + (actionsize,))
            
        """
        super().__init__(len(buckets), actionsize, lr, gamma)
        self.env = env
        self.buckets = buckets
        self.actionsize = actionsize
        self.lr = lr
        self.gamma = gamma

        if model is None:
            # buckets is 1x1x1x1, action size is 2. This syntax makes a model of size 1x1x1x1x2
            self.model = np.zeros(self.buckets + (actionsize,))
        else:
            self.model = model

    def discretize(self, obs):
        """
        Discretizes the continuous input observation

        @param obs: continuous observation
        @return: discretized observation  
        """
        upper_bounds = [self.env.observation_space.high[0], 5, self.env.observation_space.high[2], math.radians(50)]
        lower_bounds = [self.env.observation_space.low[0], -5, self.env.observation_space.low[2], -math.radians(50)]
        ratios = [(obs[i] + abs(lower_bounds[i])) / (upper_bounds[i] - lower_bounds[i]) for i in range(len(obs))]
        new_obs = [int(round((self.buckets[i] - 1) * ratios[i])) for i in range(len(obs))]
        new_obs = [min(self.buckets[i] - 1, max(0, new_obs[i])) for i in range(len(obs))]
        return tuple(new_obs)

    def qvals(self, state):
        """
        Returns the q values for the states.

        @param state: the state
        
        @return qvals: the q values for the state for each action. 
        """
        # we need to discretize the state as the model only has discrete values
        discrete_state = self.discretize(state[0])
        return np.array([self.model[discrete_state]])

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
        discrete_state = self.discretize(state)
        next_discrete_state = self.discretize(next_state)

        orig_q_est = self.model[discrete_state][action]
        
        #  target=r+γ⋅maxa′Q(s′,a′) if the state is not terminal and target=r otherwise.
        if (done == False):
            target = reward + self.gamma * max(self.model[next_discrete_state])
        else:
            target = reward

        # TD update for q values --> Q(s,a)←Q(s,a)+α⋅(target−Q(s,a))
        self.model[discrete_state][action] = self.model[discrete_state][action] + self.gamma * (target - self.model[discrete_state][action])

        # Return the square error of the original q-value estimate, i.e. the square of the difference between that and target.
        return (target - orig_q_est)**2

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

    statesize = env.observation_space.shape[0]
    actionsize = env.action_space.n
    policy = TabQPolicy(env, buckets=(8, 8, 8, 8), actionsize=actionsize, lr=args.lr, gamma=args.gamma)

    utils.qlearn(env, policy, args)

    torch.save(policy.model, 'tabular.npy')
