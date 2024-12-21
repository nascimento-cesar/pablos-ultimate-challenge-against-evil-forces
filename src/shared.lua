Draw = {}
Questions = {}
Utils = {}

Draw.character_info = {
  [1] = { "hardcore pablo", "does something" },
  [2] = { "wild pablo", "does something" },
  [3] = { "smarty pants pablo", "does something" },
  [4] = { "retro gamer pablo", "does something" }
}
Draw.character_sprites = {
  [1] = { 0, 2, 4, 6 },
  [2] = { 8, 10, 12, 14 },
  [3] = { 32, 34, 36, 38 },
  [4] = { 40, 42, 44, 46 }
}

function Draw:draw_map()
  map(0, 0, 0, 0, 16, 16)
end

function Draw:draw_sprite(n, x, y, w, h, flip_x, flip_y)
  palt(0, false)
  palt(14, true)
  spr(n, x, y, w or 1, h or 1, flip_x, flip_y)
  palt()
end

function Draw:print_bouncy_text(text, x, y, color, outline_color)
  for i = 1, #text do
    local char = sub(text, i, i)
    local offset = sin((time() * 2) + (i * 0.4)) * 1
    offset = flr(offset + 0.5)
    Draw:print_outlined_text(char, x + (i - 1) * 4, y + offset, color)
  end
end

function Draw:print_outlined_text(text, x, y, color, outline_color)
  for i = -1, 1 do
    for j = -1, 2 do
      print(text, x + i, y + j, outline_color or 0)
    end
  end

  print(text, x, y, color or 7)
end

function Draw:print_text_block(text, x, y, color, outline_color)
  local current_line = 1

  for i = 1, #text, 27 do
    Draw:print_outlined_text(sub(text, i, i + 27 - 1), x, y * current_line, color, outline_color)
    current_line += 1
  end
end

function Draw:get_h_center(text)
  return 64 - (text and #tostr(text) or 0) * 2
end

function Questions:build_questions()
  local parsed_questions, questions = {}, "you can then create the pair using a conditional statement,correct,wrong|you can then create the pair using a conditional statement,correct,wrong|you can then create the pair using a conditional statement,correct,wrong"

  for question in all(split(questions, "|")) do
    local text, correct, wrong = unpack(split(question))
    add(parsed_questions, rnd(1) < 0.5 and { text, correct, wrong, 1 } or { text, wrong, correct, 2 })
  end

  for i = #parsed_questions, 2, -1 do
    local j = ceil(rnd(i))
    parsed_questions[i], parsed_questions[j] = parsed_questions[j], parsed_questions[i]
  end

  return parsed_questions
end