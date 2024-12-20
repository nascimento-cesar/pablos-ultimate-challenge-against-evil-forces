GameplayScreen = {}

function GameplayScreen:draw(gameplay)
  GameplayScreen:draw_question(gameplay)
end

function GameplayScreen:draw_question(gameplay)
  if gameplay.current_question then
    local text, opt_a, opt_b = unpack(gameplay.current_question)

    Draw:print_text_block(text, 10, 10)
    Draw:print_outlined_text(opt_a, 10, 72)
    Draw:print_outlined_text(opt_b, 92, 72)
  end
end