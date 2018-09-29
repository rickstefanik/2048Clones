function a = hasZero(b)


[rows, cols] = size(b);

a = false;

for i=1:rows
    for j=1:cols
        if (b(i,j) == 0)
           a = true; 
        end
    end
end





end