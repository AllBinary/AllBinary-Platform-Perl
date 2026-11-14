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

package org::allbinary::animation::NullRotationAnimation2;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::animation::NullRotationAnimation';



sub new {
    my ($class) = @_;
    my $self = $class->SUPER::new('org::allbinary::math::AngleInfo'->getInstance('org::allbinary::math::AngleFactory'->getInstance()->{QUARTER_TOTAL_ANGLE}), 'org::allbinary::util::CircularIndexUtil'->createInstance(4), 'org::allbinary::animation::IndexedAnimationBehavior'->new(1, 250));
        # super(...) made $self above
    return $self;
}


sub paintXY {
    my ($self, $graphics, $x, $y) = @_;
}

use java::lang::Object ();
use javax::microedition::lcdui::Graphics ();
use org::allbinary::math::AngleFactory ();
use org::allbinary::math::AngleInfo ();
use org::allbinary::util::CircularIndexUtil ();
use org::allbinary::animation::NullRotationAnimation ();
use org::allbinary::animation::IndexedAnimationBehavior ();

1;

