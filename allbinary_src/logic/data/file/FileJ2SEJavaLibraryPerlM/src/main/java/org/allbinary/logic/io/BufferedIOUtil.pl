#
# AllBinary Open License Version 1
# Copyright (c) 2011 AllBinary
# 
# By agreeing to this license you and any business entity you represent are
# legally bound to the AllBinary Open License Version 1 legal agreement.
# 
# You may obtain the AllBinary Open License Version 1 legal agreement from
# AllBinary or the root directory of AllBinary's AllBinary Platform repository.
# 
# Created By: Travis Berthelot
#  
# Generated Code Do Not Modify

package org::allbinary::logic::io::BufferedIOUtil;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';


sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    return $self;
}


# throws Exception
sub copy {
    my ($class, $backupFile, $backupFileBak) = @_;
        my $line = 'org::allbinary::logic::string::StringUtil'->getInstance()->{EMPTY_STRING};
        my $tmpOut = 'java::io::BufferedWriter'->new('java::io::FileWriter'->new('org::allbinary::logic::io::file::AbFileNativeUtil'->get($backupFileBak)));
        my $tmpIn = 'java::io::BufferedReader'->new('java::io::FileReader'->new('org::allbinary::logic::io::file::AbFileNativeUtil'->get($backupFile)));
        while (1) {
            $line = $tmpIn->readLine();
            if (!defined($line)) {
                last;
            }
            $tmpOut->write($line, 0, length($line));
            $tmpOut->newLine();
        }
        $tmpOut->flush();
}

# use java::io::BufferedReader;
# use java::io::BufferedWriter;
# use java::io::FileReader;
# use java::io::FileWriter;
use org::allbinary::logic::io::file::AbFile;
use org::allbinary::logic::io::file::AbFileNativeUtil;
use org::allbinary::logic::string::StringUtil;

1;

