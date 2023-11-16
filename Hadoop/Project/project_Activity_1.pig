-- Load input file from HDFS
inputFile = LOAD 'hdfs:///user/AnilPothuganti/input_files' USING PigStorage('\t') AS (characters,dialogues);
grpd = GROUP inputFile BY characters;
-- Count the occurence of each word (Reduce)
totalcount = FOREACH grpd GENERATE $0 AS name, COUNT($1) as no_of_lines;
result = ORDER totalcount BY no_of_lines DESC;
rmf hdfs:///user/AnilPothuganti/output_files/pigoutput;
-- Store the result in HDFS
STORE result INTO 'hdfs:///user/AnilPothuganti/output_files/pigoutput';
