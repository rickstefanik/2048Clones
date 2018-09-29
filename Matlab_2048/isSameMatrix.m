function x = isSameMatrix(a, b)

[rows, cols] = size(a);

x = true;

for i=1:rows
    for j=1:cols
        if a(i,j) ~= b(i,j)
           x = false; 
        end
    end
end


end