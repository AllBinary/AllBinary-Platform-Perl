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

package org::allbinary::animation::TimedVectorAnimation;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::animation::VectorAnimation';


sub _init_fields {
    my ($self) = @_;
    $self->{timeElapsedHelper} = 'org::allbinary::time::TimeDelayHelper'->new(200);
}


sub new {
    my ($class, $currentPoints, $basicColor, $animationBehavior) = @_;
    my $self = $class->SUPER::new($currentPoints, $basicColor, $animationBehavior);
    $self->_init_fields();
        # super(...) made $self above
    return $self;
}


sub nextFrame {
    my ($self) = @_;
        if ($self->{timeElapsedHelper}->isTime('org::allbinary::time::GameTickTimeDelayHelperFactory'->getInstance()->{startTime})) {
            $self->SUPER::nextFrame();
        }
}

use org::allbinary::graphics::color::BasicColor;
use org::allbinary::time::GameTickTimeDelayHelperFactory;
use org::allbinary::time::TimeDelayHelper;
use org::allbinary::animation::VectorAnimation;

1;

