#!/usr/bin/perl

if ($#ARGV + 1 != 2) {
    print "Usage: php s21629944.php input.txt <search_word>\n";
    exit(1);
}


my $input_file = $ARGV[0];
open(my $fh, '<', $input_file) or die "Could not open file '$input_file' $!";

# Read the contents of the input file, Slurp mode is enabled to read entire file at once
my $input_string = do { local $/; <$fh> };
print "Original string: $input_string\n";

# Convert to lower case and remove all non-alphanumeric characters with regex expression
my $converted_string = lc($input_string);
$converted_string =~ s/[^a-zA-Z]//g;
print "Converted string: $converted_string\n";

# Get the word to find from the terminal command line that was originally passed to the script
my $word_to_find = $ARGV[1];
print "Search word: $word_to_find\n";

# Reverse the string and print it out
my $reversed = reverse($converted_string);
print "Reversed string: $reversed\n";

# Find the number of matches of the word in the reversed string
my $num_matches = () = reverse($converted_string) =~ /\Q$word_to_find/g;
print "Matches: $num_matches\n";

# To be able to run the script
# perl s21629944.pl input.txt mad