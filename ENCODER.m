function ENCODER(input)

lengthOfString = strlength(input);
convertToChar = char(input);
outputString = "";
encodedString = "";
for i = 1:lengthOfString
    indexedLetter= convertToChar(i:i);
    if indexedLetter == 'A'
        encodedChar = '00';
    elseif indexedLetter == 'B'
        encodedChar = '0';
    elseif indexedLetter == 'C'
        encodedChar = '1';
    elseif indexedLetter == 'D'
        encodedChar = '01';
    elseif indexedLetter == 'E'
        encodedChar = '10';
    elseif indexedLetter == 'F'
        encodedChar = '11';
    end 
    encodedString = string(encodedChar);
    outputString = outputString + encodedString;   
end
disp(outputString);






end