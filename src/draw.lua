function _draw()
  cls(10)

  if game.current_mode == "start" then
    StartScreen:draw()
  elseif game.current_mode == "character_selection" then
  elseif game.current_mode == "gameplay" then
  elseif game.current_mode == "game_over" then
  elseif game.current_mode == "game_over_s" then
  end
end