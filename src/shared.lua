Draw = {}
Questions = {}
Utils = {}

function Draw:print_outlined_text(text, x, y, color, outline_color)
  for i = -1, 1 do
    for j = -1, 2 do
      print(text, x + i, y + j, outline_color or 0)
    end
  end

  print(text, x, y, color or 7)
end

function Draw:print_bouncy_text(text, x, y, color, outline_color)
  for i = 1, #text do
    local char = sub(text, i, i)
    local offset = sin((time() * 2) + (i * 0.4)) * 1
    offset = flr(offset + 0.5)
    Draw:print_outlined_text(char, x + (i - 1) * 4, y + offset, color)
  end
end

function Draw:get_h_center(text)
  return 64 - (text and #tostr(text) or 0) * 2
end

function Questions:build_questions(character_index)
  local parsed_questions, questions = {}, ({ "question 1,correct,wrong|question 2,correct,wrong|question 3,correct,wrong", "", "", "" })[character_index]

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