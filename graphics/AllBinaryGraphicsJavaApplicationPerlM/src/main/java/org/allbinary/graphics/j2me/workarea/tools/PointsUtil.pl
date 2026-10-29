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

package org::allbinary::graphics::j2me::workarea::tools::PointsUtil;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';

our $instance = 'org::allbinary::graphics::j2me::workarea::tools::PointsUtil'->new();

sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    return $self;
}


sub getInstance {
    my ($class) = @_;
        return $org::allbinary::graphics::j2me::workarea::tools::PointsUtil::instance;
}


# throws Exception
sub doTransforms {
    my ($self, $pointVector, $angle, $fulcrumPoint) = @_;
        return 'org::allbinary::animation::VectorRotationGenerator'->getInstance()->getListAtAngle($fulcrumPoint->getX(), $fulcrumPoint->getY(), $pointVector, 'org::allbinary::math::AngleFactory'->getInstance()->getAt(int($angle)));
}

use org::allbinary::animation::VectorRotationGenerator;
use org::allbinary::graphics::GPoint;
use org::allbinary::math::AngleFactory;
use org::allbinary::util::BasicArrayList;

1;

