clc
clear
sample = "AAABBCCDEF";
dictionary = HUFFMANCLASS.dictionary(sample)
encodedSample = HUFFMANCLASS.encoder(dictionary.input,dictionary)
decodedSample = HUFFMANCLASS.decoder(encodedSample,dictionary)
math = HUFFMANCLASS.entropyCalculation(dictionary)

% clc
% clear
% sample = "abbaccad";
% dictionary = HUFFMANCLASSTEST.dictionary(sample)
% encodedSample = HUFFMANCLASSTEST.encoder(dictionary.input,dictionary)
% decodedSample = HUFFMANCLASSTEST.decoder(encodedSample,dictionary)
% math = HUFFMANCLASSTEST.entropyCalculation(dictionary)