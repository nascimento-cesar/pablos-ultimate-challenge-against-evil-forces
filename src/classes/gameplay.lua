Gameplay = Base:new()

function Gameplay:new(character_index)
  local obj = Base.new(self)

  obj.character_action = "idle"
  obj.character_action_frame = 0
  obj.character_index = character_index
  obj.character_sprites = Draw.character_sprites[character_index]
  obj.correct_answers = 0
  obj.current_question = nil
  obj.current_question_index = 1
  obj.enemies = {}
  obj.default_enemy_spawn_timer = 150
  obj.enemy_spawn_timer = obj.default_enemy_spawn_timer
  obj.is_correct_answer = nil
  obj.is_locked = false
  obj.questions = Questions:build_questions()
  obj.wrong_answers = 0

  return obj
end

function Gameplay:update()
  self:handle_character_action()
  self:handle_enemy_spawn()
  self:handle_selected_answer()
end

function Gameplay:handle_character_action()
  self.character_action_frame += 1

  if self.character_action ~= "idle" and self.character_action_frame >= 30 then
    if self.is_correct_answer then
      self:handle_correct_answer()
    else
      self:handle_wrong_answer()
    end

    self.character_action = "idle"
    self.character_action_frame = 1
    self.current_question_index += 1
    self.current_question = nil
    self.enemy_spawn_timer = self.default_enemy_spawn_timer
    self.is_correct_answer = nil
    self.is_locked = false
  end
end

function Gameplay:handle_enemy_spawn()
  self.enemy_spawn_timer -= 1

  if self.enemy_spawn_timer <= 0 then
    self.enemy_spawn_timer = self.default_enemy_spawn_timer
    self:spawn_enemies()
  end
end

function Gameplay:handle_selected_answer()
  if self.is_locked then
    return
  end

  if not self.current_question then
    self.current_question = self.questions[self.current_question_index]
  end

  if self.current_question then
    local text, opt_a, opt_b, correct_index, pressed_button = unpack(self.current_question)

    if btnp(⬅️) then
      pressed_button = "left"
      self.is_correct_answer = correct_index == 1
    elseif btnp(➡️) then
      pressed_button = "right"
      self.is_correct_answer = correct_index == 2
    end

    if self.is_correct_answer ~= nil then
      self.character_action = pressed_button
      self.character_action_frame = 0
      self.is_locked = true
    end
  end
end

function Gameplay:handle_correct_answer()
  self.correct_answers += 1
end

function Gameplay:handle_wrong_answer()
  self.wrong_answers += 1
  self:spawn_enemies()
end

function Gameplay:spawn_enemies()
end