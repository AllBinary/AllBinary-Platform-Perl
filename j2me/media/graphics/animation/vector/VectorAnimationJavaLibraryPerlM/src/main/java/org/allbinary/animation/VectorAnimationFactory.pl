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

package org::allbinary::animation::VectorAnimationFactory;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::animation::VectorAnimationFactoryInterface';


sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    return $self;
}


sub getInstance {
    my ($self, $points, $basicColor) = @_;
        return 'org::allbinary::animation::VectorAnimation'->new($points, $basicColor, 'org::allbinary::animation::AnimationBehavior'->getInstance());
}

use org::allbinary::graphics::color::BasicColor;
use org::allbinary::animation::VectorAnimationFactoryInterface;
use org::allbinary::animation::VectorAnimation;
use org::allbinary::animation::AnimationBehavior;

1;

