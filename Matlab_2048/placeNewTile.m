function a = placeNewTile(b)

    a = copyMat(b);

    [x, y] = findEmptySpace(b);
    
    val = randi(2);
    
    a(x, y) = val;

end