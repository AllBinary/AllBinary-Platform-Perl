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

package org::allbinary::logic::io::AbFileOutputStream;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'java::io::FileOutputStream';



# throws FileNotFoundException
sub createFromAbFile {
    my ($class, $file) = @_;
        return 'org::allbinary::logic::io::AbFileOutputStream'->new($file->getPath(), 0);
}


# throws FileNotFoundException
sub createFromAbFileAppend {
    my ($class, $file, $append) = @_;
        return 'org::allbinary::logic::io::AbFileOutputStream'->new($file->getPath(), $append);
}


# throws FileNotFoundException
sub createFromFilePath {
    my ($class, $name) = @_;
        return 'org::allbinary::logic::io::AbFileOutputStream'->new($name, 0);
}


# throws FileNotFoundException
sub createFromFilePathAppend {
    my ($class, $name, $append) = @_;
        return 'org::allbinary::logic::io::AbFileOutputStream'->new($name, $append);
}


sub new {
    my ($class, $name, $append) = @_;
    my $self = $class->SUPER::new($name, $append);
        # super(...) made $self above
    return $self;
}

# use java::io::FileNotFoundException;
# use java::io::FileOutputStream;
use org::allbinary::logic::io::file::AbFile;
use org::allbinary::logic::io::file::AbFileNativeUtil;

1;

