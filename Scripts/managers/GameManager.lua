-- Keeps track of game state for each player
GameManager = class(nil)

function GameManager.server_onCreate(self)
  self.gameStates = {}
end

function GameManager.getState(self, player)
  return self.gameStates[player.getId()]
end

function GameManager.server_onPlayerJoined(self, player)
  self.gameStates[player.getId] = {}
end

function GameManager.server_onPlayerLeft(self, player)
  self.gameStates[player.getId] = nil
end

function GameManager.startRun(self, player)
  self.gameStates[player.getId]["playing"] = true
end

function GameManager.endRun(self, player)
  self.gameStates[player.getId]["playing"] = false
end
