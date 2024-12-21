GameplayScreen = {}

function GameplayScreen:draw(gameplay)
  map(0, 0, 0, 0, 16, 16)
  palt(0, false)
  palt(14, true)
  GameplayScreen:draw_question(gameplay)
  GameplayScreen:draw_character(gameplay)
  GameplayScreen:draw_buttons(gameplay)
end

function GameplayScreen:draw_buttons(gameplay)
  if gameplay.character_action == "left" and gameplay.character_action_frame >= 12 then
    spr(65, 9, 78)
  else
    spr(64, 9, 78)
  end

  if gameplay.character_action == "right" and gameplay.character_action_frame >= 12 then
    spr(65, 22, 78)
  else
    spr(64, 22, 78)
  end
end

function GameplayScreen:draw_character(gameplay)
  if gameplay.character_action == "idle" then
    spr(gameplay.character_sprites[1], 10, 70, 2, 2)
  elseif gameplay.character_action == "left" then
    if gameplay.character_action_frame <= 4 then
      spr(gameplay.character_sprites[2], 10, 70, 2, 2, true)
    elseif gameplay.character_action_frame <= 6 then
      spr(gameplay.character_sprites[3], 10, 70, 2, 2, true)
    else
      spr(gameplay.character_sprites[4], 10, 70, 2, 2, true)
    end
  elseif gameplay.character_action == "right" then
    if gameplay.character_action_frame <= 4 then
      spr(gameplay.character_sprites[2], 10, 70, 2, 2)
    elseif gameplay.character_action_frame <= 6 then
      spr(gameplay.character_sprites[3], 10, 70, 2, 2)
    else
      spr(gameplay.character_sprites[4], 10, 70, 2, 2)
    end
  end
end

function GameplayScreen:draw_question(gameplay)
  if gameplay.current_question then
    local text, opt_a, opt_b = unpack(gameplay.current_question)

    Draw:print_text_block(text, 10, 10)
    Draw:print_outlined_text(opt_a, 10, 96)
    Draw:print_outlined_text(opt_b, 92, 96)
  end
end