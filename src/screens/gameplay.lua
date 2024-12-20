GameplayScreen = {}
GameplayScreen.limit_left_x = 8
GameplayScreen.limit_bottom_y = 64

function GameplayScreen:draw(gameplay)
  Draw:draw_map(2)
  GameplayScreen:draw_question(gameplay)
  GameplayScreen:draw_character(gameplay)
  GameplayScreen:draw_buttons(gameplay)
  GameplayScreen:draw_question_timer(gameplay)
  GameplayScreen:draw_enemies(gameplay)
end

function GameplayScreen:draw_buttons(gameplay)
  local x, y = GameplayScreen.limit_left_x, GameplayScreen.limit_bottom_y + 8

  if gameplay.character_action == "left" and gameplay.character_action_frame >= 6 then
    Draw:draw_sprite(193, x, y)
  else
    Draw:draw_sprite(192, x, y)
  end

  if gameplay.character_action == "right" and gameplay.character_action_frame >= 6 then
    Draw:draw_sprite(193, x + 14, y)
  else
    Draw:draw_sprite(192, x + 14, y)
  end
end

function GameplayScreen:draw_character(gameplay)
  local x, y = GameplayScreen.limit_left_x + 4, GameplayScreen.limit_bottom_y

  if gameplay.character_action == "idle" then
    Draw:draw_sprite(gameplay.character_sprites[1], x, y, 2, 2)
  elseif gameplay.character_action == "left" then
    x -= 5

    if gameplay.character_action_frame <= 4 then
      Draw:draw_sprite(gameplay.character_sprites[2], x, y, 2, 2, true)
    elseif gameplay.character_action_frame <= 6 then
      Draw:draw_sprite(gameplay.character_sprites[3], x, y, 2, 2, true)
    else
      Draw:draw_sprite(gameplay.character_sprites[4], x, y, 2, 2, true)
    end
  elseif gameplay.character_action == "right" then
    if gameplay.character_action_frame <= 4 then
      Draw:draw_sprite(gameplay.character_sprites[2], x, y, 2, 2)
    elseif gameplay.character_action_frame <= 6 then
      Draw:draw_sprite(gameplay.character_sprites[3], x, y, 2, 2)
    else
      Draw:draw_sprite(gameplay.character_sprites[4], x, y, 2, 2)
    end
  elseif gameplay.character_action == "sad" then
    if gameplay.character_action_frame <= 4 then
      Draw:draw_sprite(gameplay.character_sprites[5], x, y, 2, 2)
    else
      Draw:draw_sprite(gameplay.character_sprites[6], x, y, 2, 2)
    end
  end
end

function GameplayScreen:draw_enemies(gameplay)
end

function GameplayScreen:draw_question_timer(gameplay)
  local x_2, color = ((128 / gameplay.default_question_timer) * flr(gameplay.question_timer))

  if x_2 <= 42 then
    if flr(sin(time() / 0.25)) == 0 then
      color = 7
    else
      color = 8
    end
  elseif x_2 <= 84 then
    color = 10
  elseif x_2 <= 128 then
    color = 12
  end

  line(-1, 0, x_2 - 1, 0, color)
end

function GameplayScreen:draw_question(gameplay)
  if gameplay.current_question then
    local text, opt_a, opt_b = unpack(gameplay.current_question)

    Draw:print_text_block(text .. "?", GameplayScreen.limit_left_x, 12)
    Draw:print_text_block(opt_a, GameplayScreen.limit_left_x + 4, 92, 10)
    Draw:print_text_block(opt_b, 72, 92, 10)
  end
end