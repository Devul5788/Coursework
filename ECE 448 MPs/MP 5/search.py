import math
import chess.lib
from chess.lib.utils import encode, decode
from chess.lib.heuristics import evaluate
from chess.lib.core import makeMove

###########################################################################################
# Utility function: Determine all the legal moves available for the side.
# This is modified from chess.lib.core.legalMoves:
#  each move has a third element specifying whether the move ends in pawn promotion
def generateMoves(side, board, flags):
    for piece in board[side]:
        fro = piece[:2]
        for to in chess.lib.availableMoves(side, board, piece, flags):
            promote = chess.lib.getPromote(None, side, board, fro, to, single=True)
            yield [fro, to, promote]
            
###########################################################################################
# Example of a move-generating function:
# Randomly choose a move.
def random(side, board, flags, chooser):
    '''
    Return a random move, resulting board, and value of the resulting board.
    Return: (value, moveList, boardList)
      value (int or float): value of the board after making the chosen move
      moveList (list): list with one element, the chosen move
      moveTree (dict: encode(*move)->dict): a tree of moves that were evaluated in the search process
    Input:
      side (boolean): True if player1 (Min) plays next, otherwise False
      board (2-tuple of lists): current board layout, used by generateMoves and makeMove
      flags (list of flags): list of flags, used by generateMoves and makeMove
      chooser: a function similar to random.choice, but during autograding, might not be random.
    '''
    moves = [ move for move in generateMoves(side, board, flags) ]
    if len(moves) > 0:
        move = chooser(moves)
        newside, newboard, newflags = makeMove(side, board, move[0], move[1], flags, move[2])
        value = evaluate(newboard)
        return (value, [ move ], { encode(*move): {} })
    else:
        return (evaluate(board), [], {})

###########################################################################################
# Stuff you need to write:
# Move-generating functions using minimax, alphabeta, and stochastic search.
def minimax(side, board, flags, depth):
    '''
    Return a minimax-optimal move sequence, tree of all boards evaluated, and value of best path.
    Return: (value, moveList, moveTree)
      value (float): value of the final board in the minimax-optimal move sequence
      moveList (list): the minimax-optimal move sequence, as a list of moves
      moveTree (dict: encode(*move)->dict): a tree of moves that were evaluated in the search process
    Input:
      side (boolean): True if player1 (Min) plays next, otherwise False
      board (2-tuple of lists): current board layout, used by generateMoves and makeMove
      flags (list of flags): list of flags, used by generateMoves and makeMove
      depth (int >=0): depth of the search (number of moves)
    '''
    moves = [ move for move in generateMoves(side, board, flags) ]
    
    if (depth == 0):
      return (evaluate(board), [], {})

    if (side == False): # maximizing player
      minValue = -math.inf
      moveList = []
      moveTree = {}
      
      #gets child nodes
      for move in moves:
        newside, newboard, newflags = makeMove(side, board, move[0], move[1], flags, move[2])
        value, moveList_2, moveTree_2 = minimax(newside, newboard, newflags, depth - 1)
        if (minValue < value):
          minValue = value
          moveList = [move]
          moveList.extend(moveList_2)
        moveTree[encode(*move)] = moveTree_2 
      return (minValue, moveList, moveTree)
    else: # minimizing player
      maxValue = math.inf
      moveList = []
      moveTree = {}
      for move in moves:
        newside, newboard, newflags = makeMove(side, board, move[0], move[1], flags, move[2])
        value, moveList_2, moveTree_2 = minimax(newside, newboard, newflags, depth - 1)
        if (maxValue > value):
          maxValue = value
          moveList = [move]
          moveList.extend(moveList_2)
        moveTree[encode(*move)] = moveTree_2 
      return (maxValue, moveList, moveTree) 

def alphabeta(side, board, flags, depth, alpha=-math.inf, beta=math.inf):
    '''
    Return minimax-optimal move sequence, and a tree that exhibits alphabeta pruning.
    Return: (value, moveList, moveTree)
      value (float): value of the final board in the minimax-optimal move sequence
      moveList (list): the minimax-optimal move sequence, as a list of moves
      moveTree (dict: encode(*move)->dict): a tree of moves that were evaluated in the search process
    Input:
      side (boolean): True if player1 (Min) plays next, otherwise False
      board (2-tuple of lists): current board layout, used by generateMoves and makeMove
      flags (list of flags): list of flags, used by generateMoves and makeMove
      depth (int >=0): depth of the search (number of moves)
    '''
    moves = [ move for move in generateMoves(side, board, flags) ]
    
    if (depth == 0):
      return (evaluate(board), [], {})

    if (side == False): # maximizing player
      moveList = []
      moveTree = {}
      maxValue = -math.inf

      for move in moves:
        newside, newboard, newflags = makeMove(side, board, move[0], move[1], flags, move[2])
        value, moveList_2, moveTree_2 = alphabeta(newside, newboard, newflags, depth - 1, alpha, beta)
        if (maxValue < value):
          maxValue = value
          moveList = [move]
          moveList.extend(moveList_2)

        alpha = max(alpha, maxValue) 
        moveTree[encode(*move)] = moveTree_2
        if (maxValue >= beta): break
          
      return (maxValue, moveList, moveTree)
    else: # minimizing player
      moveList = []
      moveTree = {}
      minValue = math.inf

      for move in moves:
        newside, newboard, newflags = makeMove(side, board, move[0], move[1], flags, move[2])
        value, moveList_2, moveTree_2 = alphabeta(newside, newboard, newflags, depth - 1, alpha, beta)
        if (minValue > value):
          minValue = value
          moveList = [move]
          moveList.extend(moveList_2)

        beta = min(beta, minValue) 
        moveTree[encode(*move)] = moveTree_2  
        if (minValue <= alpha): break 

      return (minValue, moveList, moveTree) 
    

# For stocastic search, there are 4 major steps: selection, expansion, simulation, backpropogation. The general strategy is that you select a move from a list
# of valid moves. You then expand the move to see its children. After that you run a number of sumulations to see your score for that simulation.
# You then backpropogate attaching the average chance of winning over a number of simulations to that particular move. Finally, among all possible initial moves, 
# find the one that has the best average value ("best" means maximum value if side==False, otherwise it means minimum value). Return its value as value. As moveList, 
# return any list of moves that starts with the optimal move. In this MP breadth acts like the number of simulations for each move. Also note that moveTree must 
# include any move that is visited by the simulation as well.

def stochastic(side, board, flags, depth, breadth, chooser):
    '''
    Choose the best move based on breadth randomly chosen paths per move, of length depth-1.
    Return: (value, moveList, moveTree)
      value (float): average board value of the paths for the best-scoring move
      moveLists (list): any sequence of moves, of length depth, starting with the best move
      moveTree (dict: encode(*move)->dict): a tree of moves that were evaluated in the search process
    Input:
      side (boolean): True if player1 (Min) plays next, otherwise False
      board (2-tuple of lists): current board layout, used by generateMoves and makeMove
      flags (list of flags): list of flags, used by generateMoves and makeMove
      depth (int >=0): depth of the search (number of moves)
      breadth: number of different paths 
      chooser: a function similar to random.choice, but during autograding, might not be random.
    '''

    moves = [ move for move in generateMoves(side, board, flags) ]
    moveList = [] 
    moveTree = {}
    value = -math.inf if (side == False) else math.inf

    for move in moves:
      totalValue = 0 
      currList = [move]

      for i in range(breadth):
        newside, newboard, newflags = makeMove(side, board, move[0], move[1], flags, move[2])
        leafVal, newTree = simulateGame(newside, newboard, newflags, depth - 1, chooser, currList)
        totalValue += leafVal

        if(i == 0):
          moveTree[encode(*move)] = newTree
        else:
          moveTree[encode(*move)].update(newTree)

      if(totalValue/breadth > value and side == False or totalValue/breadth < value and side == True):
        moveList = currList
        value = totalValue/breadth
      
    return (value, moveList, moveTree)


#Inside the simulation you choose a random move for a certain depth and then move to your next depth. You keep doing this until you have reached
#the level of depth you were intending. Finally you evaluate your score, and send this back to the main function.
def simulateGame(side, board, flags, depth, chooser, currList):
  currTree = {}
  moves = [ move for move in generateMoves(side, board, flags) ]
  
  if (depth == 0):
    return (evaluate(board), {})
  
  move = chooser(moves)
  newside, newboard, newflags = makeMove(side, board, move[0], move[1], flags, move[2])
  value, tree = simulateGame(newside, newboard, newflags, depth - 1, chooser, currList)
  currList.extend([move])
  currTree[encode(*move)] = tree
  return (value, currTree)