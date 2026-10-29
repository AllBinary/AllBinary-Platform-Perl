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

package org::allbinary::game::combat::destroy::event::DestroyEventCircularStaticPool;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';

our $instance = 'org::allbinary::game::combat::destroy::event::DestroyEventCircularStaticPool'->new();

sub _init_fields {
    my ($self) = @_;
    $self->{EVENT_POOL} = 'org::allbinary::logic::util::event::AllBinaryEventCircularPool'->new(20);
}


sub getInstance {
    my ($class) = @_;
        return $org::allbinary::game::combat::destroy::event::DestroyEventCircularStaticPool::instance;
}


sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
    return $self;
}


sub init {
    my ($self, $combatGameCanvas) = @_;
        $self->{EVENT_POOL}->initAllBinaryEventCircularPool('org::allbinary::game::combat::destroy::event::DestroyEventFactory'->new($combatGameCanvas));
}


# throws Exception
sub getInstanceForLayer {
    my ($self, $layerInterface) = @_;
        my $destroyedEvent = $self->{EVENT_POOL}->getNextInstance();
        $destroyedEvent->setLayerInterfaceForCircularStaticPool($layerInterface);
        return $destroyedEvent;
}

use org::allbinary::game::displayable::canvas::AllBinaryGameCanvas;
use org::allbinary::layer::AllBinaryLayer;
use org::allbinary::logic::util::event::AllBinaryEventCircularPool;
use org::allbinary::game::combat::destroy::event::DestroyEventFactory;

1;

