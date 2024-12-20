Game = Base:new()

function Game:new()
  local obj = Base.new(self)

  obj.character_selection = nil
  obj.current_mode = "start"
  obj.frames = 1
  obj.gameplay = nil
  obj.gameplay_history = {}

  return obj
end

function Game:update()
  if self.current_mode == "start" then
    self:on_start()
  elseif self.current_mode == "character_selection" then
    self.character_selection:update(function(character_index)
      self:on_character_select(character_index)
    end)
  elseif self.current_mode == "gameplay" then
    self.gameplay:update()
  elseif self.current_mode == "game_over" then
  elseif self.current_mode == "game_over_s" then
  end

  self.frames += 1
end

function Game:on_start()
  if btnp(❎) or btnp(🅾️) then
    self.character_selection = CharacterSelection:new()
    self.current_mode = "character_selection"
  end
end

function Game:on_character_select(character_index)
  self.gameplay = Gameplay:new(character_index)
  add(self.gameplay_history, self.gameplay)
  self.current_mode = "gameplay"
end