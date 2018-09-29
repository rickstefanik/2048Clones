function x = gameLost(a)
    x = false;
    if ((hasZero(a) == false) && (noMoves(a) == true))
        x = true;
    end

end