Game = Base:new()

function Game:new()
  local obj = Base.new(self)

  obj.current_mode = "start"
  obj.frames = 1
  obj.gameplay_history = {}

  return obj
end

function Game:update()
  if self.current_mode == "start" then
    if btnp(❎) or btnp(🅾️) then
      self.current_mode = "character_selection"
    end
  elseif self.current_mode == "character_selection" then
  elseif self.current_mode == "gameplay" then
  elseif self.current_mode == "game_over" then
  elseif self.current_mode == "game_over_s" then
  end

  self.frames += 1
end