function _draw()
  cls(10)

  if game.current_mode == "start" then
    StartScreen:draw()
  elseif game.current_mode == "character_selection" then
    CharacterSelectionScreen:draw(game.character_selection)
  elseif game.current_mode == "gameplay" then
    GameplayScreen:draw(game.gameplay)
  elseif game.current_mode == "game_over" then
  elseif game.current_mode == "game_over_s" then
  end

  print(debug, 0, 0)
end