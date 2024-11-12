import argparse

parser=argparse.ArgumentParser(description='This is a parser')

parser.add_argument("-c","--counts",required=False,help="counts of numbers")
parser.add_argument("-t","--text")
parser.add_argument("-v","--verbose",action="store_false")

args=parser.parse_args()
print(args.counts)
print(args.text)
print(args.verbose)

print(args.text * int(args.counts))
