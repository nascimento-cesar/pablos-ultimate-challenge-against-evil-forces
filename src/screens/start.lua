StartScreen = {}

function StartScreen:draw()
  local text_1, text_2, text_3 = "pablo's", "ultimate challenge against", "evil forces"

  Draw:print_outlined_text(text_1, Draw:get_h_center(text_1), 42, 7)
  Draw:print_outlined_text(text_2, Draw:get_h_center(text_2), 62, 7)
  Draw:print_bouncy_text(text_3, Draw:get_h_center(text_3), 82, 8)
end