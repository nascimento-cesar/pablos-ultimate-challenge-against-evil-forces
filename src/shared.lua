Draw = {}
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