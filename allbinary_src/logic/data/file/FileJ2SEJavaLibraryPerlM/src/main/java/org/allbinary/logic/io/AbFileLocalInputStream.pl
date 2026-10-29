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

package org::allbinary::logic::io::AbFileLocalInputStream;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::logic::io::AbFileInputStream';



sub new {
    my ($class, $file) = @_;
    my $self = $class->SUPER::new('org::allbinary::logic::io::file::AbFileNativeUtil'->get($file));
        # super(...) made $self above
    return $self;
}

# use java::io::FileNotFoundException;
use org::allbinary::logic::io::file::AbFile;
use org::allbinary::logic::io::file::AbFileNativeUtil;
use org::allbinary::logic::io::AbFileInputStream;

1;

