CharacterSelectionScreen = {}

function CharacterSelectionScreen:draw(character_selection)
  for i = 1, #character_selection.characters do
    Draw:print_outlined_text(character_selection.characters[i], 0, i * 10)
  end

  Draw:print_outlined_text(character_selection.character_index, 0, 70)
end