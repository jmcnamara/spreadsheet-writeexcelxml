#!/usr/bin/perl -w

######################################################################
#
# Example of how to use the WriteExcelXML module
#
# The following converts a tab separated file into an Excel file
#
# Usage: tab2xml.pl tabfile.txt newfile.xls
#
# reverse('�'), March 2001, John McNamara, jmcnamara@cpan.org
#


use strict;
use Spreadsheet::WriteExcelXML;


# Check for valid number of arguments
if (($#ARGV < 1) || ($#ARGV > 2)) {
    die("Usage: tab2xml tabfile.txt newfile.xls\n");
};


# Open the tab delimited file
open (TABFILE, $ARGV[0]) or die "$ARGV[0]: $!";


# Create a new Excel workbook
my $workbook  = Spreadsheet::WriteExcelXML->new($ARGV[1]);
my $worksheet = $workbook->add_worksheet();

# Row and column are zero indexed
my $row = 0;

while (<TABFILE>) {
    chomp;
    # Split on single tab
    my @Fld = split('\t', $_);

    my $col = 0;
    foreach my $token (@Fld) {
        $worksheet->write($row, $col, $token);
        $col++;
    }
    $row++;
}
