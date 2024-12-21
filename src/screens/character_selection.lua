CharacterSelectionScreen = {}

function CharacterSelectionScreen:draw(character_selection)
  Draw:draw_map()

  local character_sprite = Draw.character_sprites[character_selection.character_index][1]
  local character_info = Draw.character_info[character_selection.character_index]
  local text_1 = "select your pablo"
  Draw:print_bouncy_text(text_1, Draw:get_h_center(text_1), 20)
  Draw:print_outlined_text("⬅️", 40, 68, btn(⬅️) and 7 or 12)
  Draw:draw_sprite(character_sprite, 58, 64, 2, 2)
  Draw:print_outlined_text("➡️", 80, 68, btn(➡️) and 7 or 12)
  Draw:print_outlined_text(character_info[1], Draw:get_h_center(character_info[1]), 90, 8)
  Draw:print_text_block(character_info[2], Draw:get_h_center(character_info[2]), 102)
end