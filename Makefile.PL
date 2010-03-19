use ExtUtils::MakeMaker;


WriteMakefile(
    ($] >= 5.005 ? (
    'AUTHOR'        => 'John McNamara (jmcnamara@cpan.org)',
    'ABSTRACT'      => 'Write an Excel XML file.', ) : () ),
    'NAME'          => 'Spreadsheet::WriteExcelXML',
    'VERSION_FROM'  => 'lib/Spreadsheet/WriteExcelXML.pm',
    'NEEDS_LINKING' => 0,
    'PREREQ_PM'     => {},
    'dist'          => {COMPRESS => 'gzip -best', SUFFIX => 'gz'},


);
