clc
clear
sample = "AAABBCCDEF";
dictionary = HUFFMANCLASS.dictionary(sample)
encodedSample = HUFFMANCLASS.encoder(dictionary.input,dictionary)
decodedSample = HUFFMANCLASS.decoder(encodedSample,dictionary)


% clc
% clear
% sample = "AAABBCCDEF";
% dictionary = HUFFMANCLASSTEST.dictionary(sample)
% encodedSample = HUFFMANCLASSTEST.encoder(dictionary.input,dictionary)
% decodedSample = HUFFMANCLASSTEST.decoder(encodedSample,dictionary)