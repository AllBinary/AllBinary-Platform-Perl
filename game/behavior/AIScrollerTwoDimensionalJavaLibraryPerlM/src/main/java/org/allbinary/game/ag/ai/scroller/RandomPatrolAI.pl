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

package org::allbinary::game::ag::ai::scroller::RandomPatrolAI;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::game::ag::ai::scroller::BasePatrolAI';


sub _init_fields {
    my ($self) = @_;
    $self->{changedDirection} = 1;
}


sub new {
    my ($class, $hashtable, $ownerLayerInterface, $gameInput) = @_;
    my $self = $class->SUPER::new($hashtable, $ownerLayerInterface, $gameInput);
    $self->_init_fields();
        # super(...) made $self above
        $self->updateRandomDistance();
    return $self;
}


sub updateRandomDistance {
    my ($self) = @_;
        $self->{currentDistance} = 'org::allbinary::game::rand::MyRandomFactory'->getInstance()->getAbsoluteNextInt(int($self->{maxDistance}));
}


# throws Exception
sub processAI {
    my ($self, $allBinaryLayerManager) = @_;
        $self->SUPER::update();
        $self->SUPER::processKeyAI($self->{keyDirection});
        if ($self->{changedDirection}) {
            $self->SUPER::processKeyAI($javax::microedition::lcdui::Canvas::KEY_NUM1);
            $self->updateRandomDistance();
            $self->{changedDirection} = 0;
        }
}


sub nextDirection {
    my ($self) = @_;
        $self->SUPER::nextDirection();
        $self->{changedDirection} = 1;
}

# use javax::microedition::lcdui::Canvas;
use org::allbinary::game::input::GameInput;
use org::allbinary::game::rand::MyRandomFactory;
use org::allbinary::layer::AllBinaryLayer;
use org::allbinary::layer::AllBinaryLayerManager;
use org::allbinary::util::ABHashtable;
use org::allbinary::game::ag::ai::scroller::BasePatrolAI;

1;

