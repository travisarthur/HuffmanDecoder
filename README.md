# HuffmanDecoder

Steps for encoding:
1. Count number of unique characters in the string.
2. Count the number of times the unique characters repeat in the given string
3. Take the number of the of times the unique character repeats in the given string and then 	divide that number by the length of the string.
4. The number you get from the division is the fractional piece of what percentage that 	   unique character makes up for the whole string. The sum of all the percentages for each 	   unique character should add up to 1. These percentages are the probabilities for their 	   respective character.

5. Example String: AAAABBBCCDEF
	A = 1/3
	B = 1/4
	C = 1/6
	D = 1/12
	E = 1/12
	F = 1/12
6. HUFFMAN'S ALGORITHM STEP
	1/3				1/3				1/3				1/3				1/3 -
																		 |= 1
	1/4				1/4				1/4				5/12 -			2/3 -
														  |= 2/3
	1/6				1/6				1/4 -			1/4  -
										 |5/12
	1/12 			1/6  -			1/6 -
            			  |= 1/4
	1/12 -			1/12 -
		  |= 1/6
	1/12 -

	COL 1			COL 2			COL 3			COL 4			COL 5	

	YOU START BY ADDING THE TWO LOWEST PROBABILITES IN THE COLUMN. THEN CREATE ANOTHER COLUMN  AND SORT THE AMOUNTS GREATEST TO LEAST. 