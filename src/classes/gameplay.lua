Gameplay = Base:new()

function Gameplay:new(character_index)
  local obj = Base.new(self)

  obj.character_index = character_index
  obj.correct_answers = 0
  obj.current_question_index = 1
  obj.current_question = nil
  obj.wrong_answers = 0
  obj.questions = Questions:build_questions(character_index)

  return obj
end

function Gameplay:update()
  self:handle_selected_answer()
end

function Gameplay:handle_selected_answer()
  if not self.current_question then
    self.current_question = self.questions[self.current_question_index]
  end

  if self.current_question then
    local text, opt_a, opt_b, correct_index, answer = unpack(self.current_question)

    if btnp(⬅️) then
      answer = correct_index == 1
    elseif btnp(➡️) then
      answer = correct_index == 2
    end

    if answer ~= nil then
      self.current_question_index += 1
      self.current_question = nil

      if answer then
        self.correct_answers += 1
        self:handle_correct_answer()
      else
        self.wrong_answers += 1
        self:handle_wrong_answer()
      end
    end
  end
end

function Gameplay:handle_correct_answer()
end

function Gameplay:handle_wrong_answer()
end