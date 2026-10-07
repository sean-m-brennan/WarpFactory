function s = string(x)
  if ischar(x), s = x; else, s = num2str(x); end
end
