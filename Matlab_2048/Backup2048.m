XDim = 4;
YDim = 4;


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

displayToPlayer(a);

running = true;


while running
    choice = input('', 's');
    
    b = zeros(XDim, YDim);
    
    current = a;
    
    changedTiles = zeros(XDim, YDim);
    
    switch choice
        
        case 'w'
            
        case 's'
                        
        
        
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
                                b(i, k + 1) = 1;
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
                                b(i, k-1) = 1;
                                break;
                            end
                            
                        end
                    end
                end
            end
            
    end
    
    if (isSameMatrix(a, current) == false)
        
        a = placeNewTile(a);
        
    end
    
    home;
    
    displayToPlayer(a);
    
    
end
