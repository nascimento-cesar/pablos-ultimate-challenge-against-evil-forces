StartScreen = {}

function StartScreen:draw()
  local base_y, text_1, text_2, text_3, call_to_action_x, call_to_action_y = 30, "pablo's", "ultimate challenge against", "evil forces", Draw:get_h_center("press ❎ or 🅾️ to start") - 4, 100

  Draw:print_outlined_text(text_1, Draw:get_h_center(text_1), base_y, 11)
  Draw:print_outlined_text(text_2, Draw:get_h_center(text_2), base_y + 15)
  Draw:print_bouncy_text(text_3, Draw:get_h_center(text_3), base_y + 30, 8)

  Draw:print_outlined_text("press", call_to_action_x, call_to_action_y)
  Draw:print_outlined_text("❎", call_to_action_x + 24, call_to_action_y, 11)
  Draw:print_outlined_text("or", call_to_action_x + 36, call_to_action_y)
  Draw:print_outlined_text("🅾️", call_to_action_x + 48, call_to_action_y, 8)
  Draw:print_outlined_text("to start", call_to_action_x + 60, call_to_action_y)
end