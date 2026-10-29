# Generated Code Do Not Modify

package org::allbinary::animation::NullIndexedAnimation;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::animation::IndexedAnimation';



sub new {
    my ($class, $animationBehavior) = @_;
    my $self = $class->SUPER::new($animationBehavior);
        # super(...) made $self above
    return $self;
}


# throws Exception
sub getAnimationSize {
    my ($self) = @_;
        return 0;
}

use org::allbinary::animation::IndexedAnimation;

1;

