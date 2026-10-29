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

package org::allbinary::input::automation::PointFactory;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';

our $pointArray = [map { [(undef) x (3000)] } 1 .. (3000)];


sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    return $self;
}


sub getInstance {
    my ($class, $x, $y) = @_;
        my $point = $org::allbinary::input::automation::PointFactory::pointArray->[$x]->[$y];
        if (!defined($point)) {
            $org::allbinary::input::automation::PointFactory::pointArray->[$x]->[$y] = 'org::allbinary::input::automation::Point'->new($x, $y);
            $point = $org::allbinary::input::automation::PointFactory::pointArray->[$x]->[$y];
        }
        return $point;
}

# use java::awt;
use org::allbinary::input::automation::Point;

1;

