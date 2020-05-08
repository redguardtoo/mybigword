# See  https://github.com/LuminosoInsight/wordfreq
# Zipf scale was proposed by Marc Brysbaert, who created the SUBTLEX lists.
# Zipf frequency of a word is the base-10 logarithm of the number of times it
# appears per billion words.

import sys
from wordfreq import zipf_frequency

def usage():
    print("USAGE: python get-wordfreq.py english-words.txt")

if __name__=="__main__":
    if len(sys.argv) < 2:
        usage()
        exit(1)

    rd = open (sys.argv[1], "r")
    while True:
        line = rd.readline()
        if not line :
            break;
        word = line.strip()
        freq = zipf_frequency(word, 'en')
        print("%s %s" % (word, format(freq, '.2f')))