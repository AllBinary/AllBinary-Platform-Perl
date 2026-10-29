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

package org::allbinary::input::automation::PointHelper;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';

our $two = 2.0;


sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    return $self;
}


sub getCenterPoint {
    my ($class, $rectangle) = @_;
        my $x = $rectangle->getX() + $rectangle->getWidth() / $org::allbinary::input::automation::PointHelper::two;
        my $y = $rectangle->getY() + $rectangle->getHeight() / $org::allbinary::input::automation::PointHelper::two;
        return 'org::allbinary::input::automation::PointFactory'->getInstance(int($x), int($y));
}

# use java::awt;
use org::allbinary::input::automation::PointFactory;

1;

