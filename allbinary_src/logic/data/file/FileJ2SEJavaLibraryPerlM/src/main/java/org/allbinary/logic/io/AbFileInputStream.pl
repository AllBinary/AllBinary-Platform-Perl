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

package org::allbinary::logic::io::AbFileInputStream;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'java::lang::Object';



sub new {
    my ($class, $name) = @_;
    my $self = $class->SUPER::new($name);
        # super(...) made $self above
    return $self;
}


# throws FileNotFoundException
sub createFromAbFile {
    my ($class, $file) = @_;
        return 'org::allbinary::logic::io::AbFileInputStream'->new('org::allbinary::logic::io::file::AbFileNativeUtil'->get($file)->getPath());
}


# throws FileNotFoundException
sub createFromFile {
    my ($class, $file) = @_;
        return 'org::allbinary::logic::io::AbFileInputStream'->new($file->getPath());
}

use java::lang::Object ();
use java::io::File ();
# use java::io::FileInputStream ();
# use java::io::FileNotFoundException ();
use org::allbinary::logic::io::file::AbFile ();
use org::allbinary::logic::io::file::AbFileNativeUtil ();

1;

