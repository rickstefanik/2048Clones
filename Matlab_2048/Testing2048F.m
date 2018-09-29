function Testing2048F(handles)

XDim = 4;
YDim = 4;

score = str2double(handles.scoreText.String);

a = zeros(XDim, YDim);


pos1x = randi(XDim);
pos1y = randi(YDim);

pos2x = randi(XDim);
pos2y = randi(YDim);

while ((pos2x == pos1x) && (pos2y == pos1y))
    pos2x = randi(XDim);
    pos2y = randi(YDim);
end

a(pos1x, pos1y) = 1;
a(pos2x, pos2y) = 1;

% displayToPlayer(a);
displayOnGUI(a, handles)

running = true;


 while running
    if (gameLost(a) == true)  
       handles.gameOverText.String = 'Game Over';
       handles.scoreText.String = num2str(score);
       running = false;
       break;
    end
    
    
    
    
    
    
    
    
    
    
    
    if (handles.keyboardButton.Value == 1)
    
    
    choice = input('', 's');    
        
    b = zeros(XDim, YDim);
    
    current = a;
    
    
    switch choice
        
        case 'w'
            for j = 1:YDim
                for i = 2:XDim
                    for k = i:-1:2
                        if (a(k, j) ~= 0)
                            
                            if (a(k-1, j) == 0)
                                a(k-1, j) = a(k, j);
                                a(k, j) = 0;
                            elseif ((a(k, j) == a(k-1, j)) && (b(k-1, j) == 0))
                                a(k-1, j) = a(k, j) + 1;
                                a(k, j) = 0;
                                
                                
                                p = k - 1;
                                
                                while (p > 0)
                                    
                                    
                                    b(p, j) = 1;
                                    p = p - 1;
                                end
                                
                                
                                score = score + 2^(a(k-1,j));
                                
                                break;
                                
                            end
                            
                        end
                    end
                end
            end
            
            
            
            
            
            
        case 's'
            for j = 1:YDim
                for i = XDim-1:-1:1
                    for k = i:XDim-1
                        if (a(k, j) ~= 0)
                            
                            if (a(k+1,j) == 0)
                                a(k+1, j) = a(k, j);
                                a(k, j) = 0;
                            elseif ((a(k, j) == a(k+1, j)) && (b(k+1, j) == 0))
                                a(k+1, j) = a(k, j) + 1;
                                a(k, j) = 0;
                                
                                p = k + 1;
                                
                                while (p < XDim + 1)
                                    
                                    
                                    b(p, j) = 1;
                                    p = p + 1;
                                end
                                
                                
                                score = score + 2^(a(k+1,j));
                                
                                
                                break;
                            end
                            
                        end
                    end
                end
            end
            
        case 'd'
            for i = 1:XDim
                for j = YDim-1:-1:1
                    for k = j:YDim-1
                        if (a(i, k) ~= 0)
                            
                            if (a(i,k+1) == 0)
                                a(i, k+1) = a(i, k);
                                a(i, k) = 0;
                            elseif ((a(i, k) == a(i, k+1)) && (b(i, k+1) == 0))
                                a(i, k + 1) = a(i, k) + 1;
                                a(i, k) = 0;
                                
                                
                                p = k;
                                
                                while (p < YDim + 1)
                                    
                                    
                                    b(i, p) = 1;
                                    p = p + 1;
                                end
                                
                                score = score + 2^(a(i,k+1));
                                
                                
                                
                                break;
                            end
                            
                        end
                    end
                end
            end
            
            
            
            
        case 'a'
            for i = 1:XDim
                for j = 2:YDim
                    for k = j:-1:2
                        if (a(i, k) ~= 0)
                            
                            if (a(i,k-1) == 0)
                                a(i, k-1) = a(i, k);
                                a(i, k) = 0;
                            elseif ((a(i, k) == a(i, k-1)) && (b(i, k-1) == 0))
                                a(i, k - 1) = a(i, k) + 1;
                                a(i, k) = 0;
                                
                                
                                
                                p = k -1;
                                
                                while (p > 0)
                                    
                                    b(i, p) = 1;
                                    p = p - 1;
                                    
                                end
                                
                                
                                score = score + 2^(a(i, k-1));
                                
                                break;
                            end
                            
                        end
                    end
                end
            end
            
    end
    
    
    if (gameLost(a) == true)  
       handles.gameOverText.String = 'Game Over';
       handles.scoreText.String = num2str(score);
       running = false; 
       break;
    end
    
    if ((hasZero(a) == true) && (isSameMatrix(a, current) == false))
           
        a = placeNewTile(a);
            
    end
    
    home;
    
    handles.scoreText.String = num2str(score);
    displayOnGUIE(a, current, handles)
    
    
    elseif (handles.mouseButton.Value == 1)
       
      
        
    b = zeros(XDim, YDim);
    
    current = a;
    
    
 
        
    if (handles.upButton.Value == 1)
            for j = 1:YDim
                for i = 2:XDim
                    for k = i:-1:2
                        if (a(k, j) ~= 0)
                            
                            if (a(k-1, j) == 0)
                                a(k-1, j) = a(k, j);
                                a(k, j) = 0;
                            elseif ((a(k, j) == a(k-1, j)) && (b(k-1, j) == 0))
                                a(k-1, j) = a(k, j) + 1;
                                a(k, j) = 0;
                                
                                
                                p = k - 1;
                                
                                while (p > 0)
                                    
                                    
                                    b(p, j) = 1;
                                    p = p - 1;
                                end
                                
                                
                                score = score + 2^(a(k-1,j));
                                
                                break;
                                
                            end
                            
                        end
                    end
                end
            end
            
      
            
            
            
            
    elseif handles.downButton.Value == 1
            for j = 1:YDim
                for i = XDim-1:-1:1
                    for k = i:XDim-1
                        if (a(k, j) ~= 0)
                            
                            if (a(k+1,j) == 0)
                                a(k+1, j) = a(k, j);
                                a(k, j) = 0;
                            elseif ((a(k, j) == a(k+1, j)) && (b(k+1, j) == 0))
                                a(k+1, j) = a(k, j) + 1;
                                a(k, j) = 0;
                                
                                p = k + 1;
                                
                                while (p < XDim + 1)
                                    
                                    
                                    b(p, j) = 1;
                                    p = p + 1;
                                end
                                
                                
                                score = score + 2^(a(k+1,j));
                                
                                
                                break;
                            end
                            
                        end
                    end
                end
            end
            
    elseif handles.rightButton.Value == 1
            for i = 1:XDim
                for j = YDim-1:-1:1
                    for k = j:YDim-1
                        if (a(i, k) ~= 0)
                            
                            if (a(i,k+1) == 0)
                                a(i, k+1) = a(i, k);
                                a(i, k) = 0;
                            elseif ((a(i, k) == a(i, k+1)) && (b(i, k+1) == 0))
                                a(i, k + 1) = a(i, k) + 1;
                                a(i, k) = 0;
                                
                                
                                p = k;
                                
                                while (p < YDim + 1)
                                    
                                    
                                    b(i, p) = 1;
                                    p = p + 1;
                                end
                                
                                score = score + 2^(a(i,k+1));
                                
                                
                                
                                break;
                            end
                            
                        end
                    end
                end
            end
            
            
            
            
    elseif handles.leftButton.Value == 1
            for i = 1:XDim
                for j = 2:YDim
                    for k = j:-1:2
                        if (a(i, k) ~= 0)
                            
                            if (a(i,k-1) == 0)
                                a(i, k-1) = a(i, k);
                                a(i, k) = 0;
                            elseif ((a(i, k) == a(i, k-1)) && (b(i, k-1) == 0))
                                a(i, k - 1) = a(i, k) + 1;
                                a(i, k) = 0;
                                
                                
                                
                                p = k -1;
                                
                                while (p > 0)
                                    
                                    b(i, p) = 1;
                                    p = p - 1;
                                    
                                end
                                
                                
                                score = score + 2^(a(i, k-1));
                                
                                break;
                            end
                            
                        end
                    end
                end
            end
            
    end
    
    
    if (gameLost(a) == true)  
       handles.gameOverText.String = 'Game Over';
       handles.scoreText.String = num2str(score);
       running = false; 
       break;
    end
    
    if ((hasZero(a) == true) && (isSameMatrix(a, current) == false))
           
        a = placeNewTile(a);
            
    end
    
    home;
    
    handles.scoreText.String = num2str(score);
    displayOnGUIE(a, current, handles)    
        
             
    end
        
 end

end
