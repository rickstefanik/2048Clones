function x = noMoves(a)

x = true;

[rows, cols] = size(a);

for i=1:rows
    for j=1:cols
        if (i > 1)
           if (a(i, j) == a(i - 1, j))
              x = false; 
           end            
        end
        
        if (j > 1)
           if (a(i, j) == a(i, j-1))
              x = false; 
           end            
        end
        
        if (i < rows)
           if (a(i, j) == a(i+1, j))
              x = false; 
           end
        end
        
        if (j < cols)
           if (a(i,j) == a(i, j+1))
              x = false; 
           end            
        end
        
        
        if (x == false)
            
           break; 
        end
        
        
        
    end
    
    if (x == false)
        
       break; 
    end
end

end