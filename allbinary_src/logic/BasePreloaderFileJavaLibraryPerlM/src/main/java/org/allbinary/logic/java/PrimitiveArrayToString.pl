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

package org::allbinary::logic::java::PrimitiveArrayToString;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';


sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    return $self;
}


sub toString {
    my ($class, $floats) = @_;
        my $stringBuffer = 'org::allbinary::logic::string::StringMaker'->new();
        for (my $index = 0; $index < scalar(@{$floats}); $index++) {
            $stringBuffer->appendfloat($floats->[$index]);
        }
        return $stringBuffer->toString();
}

use org::allbinary::logic::string::StringMaker;

1;

