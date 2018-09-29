function [x, y] = findEmptySpace(a)

[rows, cols] = size(a);

x = randi(rows);
y = randi(cols);


value = a(x, y);

while (value ~= 0)
    
    x = randi(rows);
    y = randi(cols);
    
    value = a(x, y);
end

end