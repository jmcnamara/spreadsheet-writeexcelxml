#!/usr/bin/perl -w

###############################################################################
#
# Example of how to use the WriteExcelXML module
#
# Program to convert a CSV comma-separated value file into an Excel file.
# This is more or less an non-op since Excel can read CSV files.
# The program uses Text::CSV_XS to parse the CSV.
#
# Usage: csv2xml.pl file.csv newfile.xls
#
# reverse('�'), March 2001, John McNamara, jmcnamara@cpan.org
#

use strict;
use Spreadsheet::WriteExcelXML;
use Text::CSV_XS;

# Check for valid number of arguments
if (($#ARGV < 1) || ($#ARGV > 2)) {
   die("Usage: csv2xml csvfile.txt newfile.xls\n");
};

# Open the Comma Seperated Variable file
open (CSVFILE, $ARGV[0]) or die "$ARGV[0]: $!";

# Create a new Excel workbook
my $workbook  = Spreadsheet::WriteExcelXML->new($ARGV[1]);

die "Couldn't create new Excel file: $!.\n" unless defined $workbook;

my $worksheet = $workbook->add_worksheet();

# Create a new CSV parsing ojbect
my $csv = Text::CSV_XS->new;

# Row and column are zero indexed
my $row = 0;


while (<CSVFILE>) {
    if ($csv->parse($_)) {
        my @Fld = $csv->fields;

        my $col = 0;
        foreach my $token (@Fld) {
            $worksheet->write($row, $col, $token);
            $col++;
        }
        $row++;
    }
    else {
        my $err = $csv->error_input;
        print "Text::CSV_XS parse() failed on argument: ", $err, "\n";
    }
}
