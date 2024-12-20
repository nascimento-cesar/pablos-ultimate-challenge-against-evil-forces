Gameplay = Base:new()

function Gameplay:new()
  local obj = Base.new(self)

  obj.character = nil
  obj.correct_answers = 0
  obj.wrong_answers = 0

  return obj
end

function Gameplay:update()
end