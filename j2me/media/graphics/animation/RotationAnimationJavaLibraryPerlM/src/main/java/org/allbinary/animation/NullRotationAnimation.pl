# Generated Code Do Not Modify

package org::allbinary::animation::NullRotationAnimation;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::animation::RotationAnimation';



sub createTotalAngle {
    my ($class, $angleInfo, $totalAngle, $animationBehavior) = @_;
        return 'org::allbinary::animation::NullRotationAnimation'->new($angleInfo, 'org::allbinary::util::CircularIndexUtil'->createInstance($totalAngle / $angleInfo->getAngleIncrementInfo()->getAngleIncrement()), $animationBehavior);
}


sub createQuarter {
    my ($class, $animationBehavior) = @_;
        return 'org::allbinary::animation::NullRotationAnimation'->new('org::allbinary::math::AngleInfo'->getInstance('org::allbinary::math::AngleFactory'->getInstance()->{QUARTER_TOTAL_ANGLE}), 'org::allbinary::util::CircularIndexUtil'->createInstance(4), $animationBehavior);
}


sub new {
    my ($class, $angleInfo, $circularIndexUtil, $animationBehavior) = @_;
    my $self = $class->SUPER::new($angleInfo, $circularIndexUtil, $animationBehavior);
        # super(...) made $self above
    return $self;
}


# throws Exception
sub getAnimationSize {
    my ($self) = @_;
        return 0;
}

use org::allbinary::math::AngleFactory;
use org::allbinary::math::AngleInfo;
use org::allbinary::util::CircularIndexUtil;
use org::allbinary::animation::RotationAnimation;

1;

