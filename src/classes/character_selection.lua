CharacterSelection = Base:new()

function CharacterSelection:new()
  local obj = Base.new(self)

  obj.character_index = 1
  obj.characters = {
    "gaming dude",
    "musical dude",
    "nature dude",
    "reading dude"
  }

  return obj
end

function CharacterSelection:update(on_character_select)
  if btnp(⬅️) then
    self.character_index -= self.character_index == 1 and -3 or 1
  elseif btnp(➡️) then
    self.character_index += self.character_index == 4 and -3 or 1
  elseif btnp(❎) or btnp(🅾️) then
    on_character_select(self.character_index)
  end
end