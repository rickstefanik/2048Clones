function displayToPlayer(x)
[rows, cols] = size(x);

a = zeros(rows, cols);


for i = 1:rows
    for j = 1:cols
        
        if (x(i, j) ~= 0)
            a(i, j) = 2^(x(i,j));
        end
        
    end
    
end

disp(a);


end