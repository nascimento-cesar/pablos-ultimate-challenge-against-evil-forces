GameplayScreen = {}

function GameplayScreen:draw(gameplay)
  Draw:print_outlined_text(gameplay.correct_answers, 0, 10)
  Draw:print_outlined_text(gameplay.wrong_answers, 0, 20)

  if gameplay.current_question then
    local text, opt_a, opt_b = unpack(gameplay.current_question)
    Draw:print_outlined_text(text, Draw:get_h_center(text), 62)
    Draw:print_outlined_text(opt_a, Draw:get_h_center(opt_a), 72)
    Draw:print_outlined_text(opt_b, Draw:get_h_center(opt_b), 82)
  end
end