function displayOnGUI(a, handles)

[rows, cols] = size(a);




% axesArray = [handles.axes1, handles.axes2, handles.axes3, handles.axes4, handles.axes5,
%     handles.axes6, handles.axes7, handles.axes8, handles.axes9, handles.axes10,
%     handles.axes11, handles.axes12, handles.axes13, handles.axes14, handles.axes15,
%     handles.axes16];

count = 1;

for i=1:rows
    for j=1:cols
        numThere = 2^(a(i, j));
        
        picString = [num2str(numThere), '.png'];
        picture = imread(picString);
        
        
        
        if (count == 1)
            imshow(picture, 'Parent', handles.axes1);
            
        elseif (count == 2)
            imshow(picture, 'Parent', handles.axes2);
            
        elseif (count == 3)
            imshow(picture, 'Parent', handles.axes3);
            
        elseif (count == 4)
            imshow(picture, 'Parent', handles.axes4);
            
        elseif (count == 5)
            imshow(picture, 'Parent', handles.axes5);
            
        elseif (count == 6)
            imshow(picture, 'Parent', handles.axes6);
            
        elseif (count == 7)
            imshow(picture, 'Parent', handles.axes7);
            
        elseif (count == 8)
            imshow(picture, 'Parent', handles.axes8);
            
        elseif (count == 9)
            imshow(picture, 'Parent', handles.axes9);
            
        elseif (count == 10)
            imshow(picture, 'Parent', handles.axes10);
            
        elseif (count == 11)
            imshow(picture, 'Parent', handles.axes11);
            
        elseif (count == 12)
            imshow(picture, 'Parent', handles.axes12);
            
        elseif (count == 13)
            imshow(picture, 'Parent', handles.axes13);
            
        elseif (count == 14)
            imshow(picture, 'Parent', handles.axes14);
            
        elseif (count == 15)
            imshow(picture, 'Parent', handles.axes15);
            
        elseif (count == 16)
            imshow(picture, 'Parent', handles.axes16);
        end
        
        count = count + 1;
        
    end
end

end