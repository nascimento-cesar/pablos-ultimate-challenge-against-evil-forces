Gameplay = Base:new()

function Gameplay:new(character_index)
  local obj = Base.new(self)

  obj.character_index = character_index
  obj.correct_answers = 0
  obj.wrong_answers = 0

  return obj
end

function Gameplay:update()
end