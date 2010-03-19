#!/usr/bin/perl -w

###############################################################################
#
# Simple example of merging cells using the Spreadsheet::WriteExcelXML module.
#
# This merges three cells using the "Centre Across Selection" alignment.
# This was the Excel 5 method of achieving a merge. Use the merge_range()
# worksheet method instead. See merge3.pl - merge4.pl.
#
# reverse('�'), August 2002, John McNamara, jmcnamara@cpan.org
#

use strict;
use Spreadsheet::WriteExcelXML;

# Create a new workbook and add a worksheet
my $workbook  = Spreadsheet::WriteExcelXML->new("merge1.xls");
die "Couldn't create new Excel file: $!.\n" unless defined $workbook;


my $worksheet = $workbook->add_worksheet();


# Increase the cell size of the merged cells to highlight the formatting.
$worksheet->set_column('B:D', 20);
$worksheet->set_row(2, 30);


# Create a merge format
my $format = $workbook->add_format(center_across => 1);


# Only one cell should contain text, the others should be blank.
$worksheet->write      (2, 1, "Center across selection", $format);
$worksheet->write_blank(2, 2,                            $format);
$worksheet->write_blank(2, 3,                            $format);

