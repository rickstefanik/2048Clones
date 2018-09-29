function a = copyMat(b)
   [rows, cols] = size(b);
   
   a = zeros(rows, cols);
   
   for i = 1:rows
       for j = 1:cols
            a(i, j) = b(i, j);
       end
   end


end