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

package org::allbinary::game::ai::BasicAI;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::ai::ArtificialIntelligence','org::allbinary::game::input::GameKeyEventSourceInterface';

our $AI_VISITOR = 'org::allbinary::logic::math::SmallIntegerSingletonFactory'->getInstance()->getAt(2);
our $ID = 'org::allbinary::logic::math::SmallIntegerSingletonFactory'->getInstance()->getAt(1);

sub _init_fields {
    my ($self) = @_;
    $self->{logUtil} = 'org::allbinary::logic::communication::log::LogUtil'->getInstance();
    $self->{commonStrings} = 'org::allbinary::string::CommonStrings'->getInstance();
    $self->{gameKeyEventFactory} = 'org::allbinary::game::input::event::GameKeyEventFactory'->getInstance();
    $self->{ownerLayerInterface} = undef;
    $self->{gameInput} = undef;
    $self->{lastKey} = -1;
}


sub new {
    my ($class, $ownerLayerInterface, $gameInput) = @_;
    my $self = $class->SUPER::new();
    $self->_init_fields();
        $self->{ownerLayerInterface} = $ownerLayerInterface;
        $self->{gameInput} = $gameInput;
    return $self;
}


# throws Exception
sub processAI {
    my ($self, $allBinaryLayerManager) = @_;
        die ($self->{commonStrings}->{NOT_IMPLEMENTED});
}


# throws Exception
sub processKeyAI {
    my ($self, $key) = @_;
        if ($key != -1) {
            $self->{gameInput}->add($self->{gameKeyEventFactory}->getInstanceForKey($self, $key));
        }
}


sub setLastKey {
    my ($self, $lastKey) = @_;
        $self->{lastKey} = $lastKey;
}


sub getLastKey {
    my ($self) = @_;
        return $self->{lastKey};
}


sub getOwnerLayerInterface {
    my ($self) = @_;
        return $self->{ownerLayerInterface};
}


sub getGameInput {
    my ($self) = @_;
        return $self->{gameInput};
}


sub getName {
    my ($self) = @_;
        return ref($self);
}


sub toString {
    my ($self) = @_;
        my $stringBuffer = 'org::allbinary::logic::string::StringMaker'->new();
        $stringBuffer->append('org::allbinary::string::CommonSeps'->getInstance()->{NEW_LINE});
        $stringBuffer->append($self->getName());
        $stringBuffer->append(" LastKey: ");
        $stringBuffer->append('org::allbinary::game::displayable::canvas::CanvasUtil'->getKeyName($self->getLastKey()));
        return $stringBuffer->toString();
}


sub getSourceId {
    my ($self) = @_;
        return 1;
}

use org::allbinary::ai::ArtificialIntelligence;
use org::allbinary::game::displayable::canvas::CanvasUtil;
use org::allbinary::game::input::GameInput;
use org::allbinary::game::input::GameKeyEventSourceInterface;
use org::allbinary::game::input::event::GameKeyEventFactory;
use org::allbinary::layer::AllBinaryLayer;
use org::allbinary::layer::AllBinaryLayerManager;
use org::allbinary::logic::communication::log::LogUtil;
use org::allbinary::logic::math::SmallIntegerSingletonFactory;
use org::allbinary::logic::string::StringMaker;
use org::allbinary::string::CommonSeps;
use org::allbinary::string::CommonStrings;

1;

