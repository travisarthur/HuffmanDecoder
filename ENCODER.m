function ENCODER(input)
lengthOfString = strlength(input);
convertToChar = char(input);
[uniqueLetters,~] = unique(convertToChar);
lengthOfUniqueLetters = length(uniqueLetters);
countUniqueLettersArray = [];
for j = 1:lengthOfUniqueLetters
    countUniqueLetters = count(convertToChar,uniqueLetters(j));
    countUniqueLettersArray = [countUniqueLettersArray countUniqueLetters];
end
letterProbability = countUniqueLettersArray ./ lengthOfString;
for i = 1:lengthOfString
    indexedLetter = convertToChar(i:i);
end


return





end