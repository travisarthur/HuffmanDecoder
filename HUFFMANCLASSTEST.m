classdef HUFFMANCLASSTEST
    methods (Static)
        function image = dictionary(inputString)
            % The function dictionary has two nested functions
            letterProbability = getLetterProbability(inputString);
            for i = 1:length(letterProbability)    
                key{i} = '';      
                map{i} = i;          
            end
            while (letterProbability < 1) 
                [~, colPosition] = sort(letterProbability);% Gets col index for probabilities                
                lastIndex = colPosition(1);
                secondToLastIndex = colPosition(2);         
                onesGroup = map{lastIndex}; % Assigns priority to probabilities
                zerosGroup = map{secondToLastIndex};         
                lastProbability = letterProbability(lastIndex);  
                secondToLastProbability  = letterProbability(secondToLastIndex);                
                holderArray = [onesGroup, zerosGroup]; 
                sumOfProbabilities   = lastProbability + secondToLastProbability; % adding the two lowest probabilities               
                map(colPosition(1:2)) = ''; % resets the map and letter probability
                letterProbability(colPosition(1:2)) = '';
                map = [map holderArray]; % combines into map
                letterProbability = [letterProbability sumOfProbabilities];                    
                key = createBinaryKey(key,onesGroup,'1'); % creates binary key from a bottom up approach
                key = createBinaryKey(key,zerosGroup,'0');
            end            
            image.map = uniqueLettersCell; 
            image.binaryKey = key;
            image.input = inputStringCell;
            
            
            function letterProbability = getLetterProbability(inputString)
                lengthOfString = strlength(inputString);
                convertToChar = char(inputString);
                [uniqueLetters,~] = unique(convertToChar);
                lengthOfUniqueLetters = length(uniqueLetters);
                image.lengthOfUniqueLetters = lengthOfUniqueLetters;
                countUniqueLettersArray = [];
                uniqueLettersCell = {};
                inputStringCell = cell(1,lengthOfString);
                for j = 1:lengthOfUniqueLetters % Counting the unique letters and filling the cells
                    countUniqueLetters = count(convertToChar,uniqueLetters(j));
                    countUniqueLettersArray = [countUniqueLettersArray countUniqueLetters];
                    uniqueLettersCell{1,j} = uniqueLetters(j);
                end
                letterProbability = countUniqueLettersArray ./ lengthOfString; %gets Probability of unique letter in string
                image.probability = letterProbability;
                for k = 1:lengthOfString
                    inputStringCell{k} = convertToChar(k); % Preserves input for dictionary
                end
            end
               
            function key = createBinaryKey(key,zeroOrOnesGroup,zeroOrOne)
                for l = 1:length(zeroOrOnesGroup) % Puts in or combines either 1 or 0 into cell
                    key{zeroOrOnesGroup(l)} = strcat(zeroOrOne,key{zeroOrOnesGroup(l)});
                end
            end
        end
       
        function encodedOutput = encoder(inputFromDictionary,dictionary)
            
            dictionaryLength = length(dictionary.binaryKey); 
            encodedOutput = ''; 
            while(~isempty(inputFromDictionary)) 
                holderEncodedOutput = ''; 
                for j = 1 : dictionaryLength                
                    if( strcmp(inputFromDictionary(1),dictionary.map{j})) % Compares map to key and converts each letter
                        holderEncodedOutput = dictionary.binaryKey{j};            
                    break;
                    end
                end       
                encodedOutput = strcat(encodedOutput,holderEncodedOutput); % Combines the binary string
                inputFromDictionary = inputFromDictionary(2:end); %Removes a letter until the cell is empty
            end  
      end
        
        function decodedOutput = decoder(encodedInput,dictionary)
            
            decodedOutput = [];
            holderInput = encodedInput;
            binaryKeyIndex = 1;
            while(~isempty(holderInput))
                indexForDecoding = holderInput(binaryKeyIndex); 
                holderDictionary = dictionary;
                while (1) 
                    dictionaryForDecoding = getBinaryDecoding(indexForDecoding,binaryKeyIndex,holderDictionary);
                    holderDictionary = dictionaryForDecoding; 
                    if (length(holderDictionary.binaryKey) ~= 1) 
                        binaryKeyIndex = binaryKeyIndex + 1;   % Will get were the decoding stopped at then push it to next index before reiterating
                        indexForDecoding = holderInput(binaryKeyIndex);    
                    else 
                        binaryKeyIndex = 1;
                        holderInput = holderInput(length(holderDictionary.binaryKey{1})+1:end);
                    break;
                    end        
                end
                decodedOutput = [decodedOutput holderDictionary.map];
            end
            
            function dictionaryForDecoding = getBinaryDecoding(code,pos,holderDictionary)
                %This is the bulk of the decoding. This will iterate
                %through the binary string until it can find its match
                dictionaryForDecoding.map={}; 
                dictionaryForDecoding.binaryKey={};
                j = 1;                   
                for i = 1:length(holderDictionary.binaryKey)
                    if (strcmp(holderDictionary.binaryKey{i}(pos), code) )                        
                        dictionaryForDecoding.map(j) = holderDictionary.map(i); 
                        dictionaryForDecoding.binaryKey(j) = holderDictionary.binaryKey(i);     
                        j = j + 1;                        
                    end
                end
            end
        end
        
        function calculations = entropyCalculation(dictionary)
            lengthOfRespectiveBinary = cellfun('length',dictionary.binaryKey);
            avgLengthOfBinary = sum(lengthOfRespectiveBinary)./dictionary.lengthOfUniqueLetters;
            calculations.entropy = -sum(dictionary.probability .* log2(dictionary.probability));
            calculations.efficiency = calculations.entropy ./ avgLengthOfBinary;
            
        end
    end
end