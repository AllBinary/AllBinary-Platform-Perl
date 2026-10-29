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

package org::allbinary::game::ag::ai::scroller::TimedFireAI;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::game::ai::BasicAI';

our $TIME = 'org::allbinary::logic::math::SmallIntegerSingletonFactory'->getInstance()->getAt(1);

sub _init_fields {
    my ($self) = @_;
    $self->{maxFireDelayTimeHelper} = 'org::allbinary::time::TimeDelayHelper'->new(0);
    $self->{delay} = undef;
}


sub new {
    my ($class, $delay, $ownerLayerInterface, $gameInput) = @_;
    my $self = $class->SUPER::new($ownerLayerInterface, $gameInput);
    $self->_init_fields();
        # super(...) made $self above
        $self->{delay} = $delay;
    return $self;
}


# throws Exception
sub processAI {
    my ($self, $allBinaryLayerManager) = @_;
        my $timeFiredInterface = $self->getOwnerLayerInterface();
        if ($self->{maxFireDelayTimeHelper}->isTime('org::allbinary::time::GameTickTimeDelayHelperFactory'->getInstance()->{startTime}) && $timeFiredInterface->getLastFireTime() + $self->{maxFireDelayTimeHelper}->{delay} < $self->{maxFireDelayTimeHelper}->getStartTime()) {
            $self->SUPER::processKeyAI($javax::microedition::lcdui::Canvas::KEY_NUM1);
            $self->{maxFireDelayTimeHelper}->{delay} = $self->{delay};
        }
}

# use javax::microedition::lcdui::Canvas;
use org::allbinary::game::ai::BasicAI;
use org::allbinary::game::input::GameInput;
use org::allbinary::layer::AllBinaryLayer;
use org::allbinary::layer::AllBinaryLayerManager;
use org::allbinary::logic::math::SmallIntegerSingletonFactory;
use org::allbinary::time::GameTickTimeDelayHelperFactory;
use org::allbinary::time::TimeDelayHelper;

1;

