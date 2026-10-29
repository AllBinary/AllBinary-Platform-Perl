# Generated Code Do Not Modify

package org::allbinary::game::collision::Collision2DProcessor;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::game::collision::CollisionProcessor';


sub new {
    my ($class) = @_;
    my $self = $class->SUPER::new();
    return $self;
}


sub isCollision {
    my ($self, $myLayer, $myLayer2) = @_;
        if ($myLayer2->getXP() >= $myLayer->getX2() || $myLayer2->getYP() >= $myLayer->getY2() || $myLayer2->getX2() <= $myLayer->getXP() || $myLayer2->getY2() <= $myLayer->getYP()) {
            return 0;
        } else {
            return 1;
        }
}

use org::allbinary::layer::AllBinaryLayer;
use org::allbinary::game::collision::CollisionProcessor;

1;

