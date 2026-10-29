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

package org::allbinary::game::ag::ai::MultiKeyPressesAI;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::game::ag::ai::KeyPressesAI';


sub _init_fields {
    my ($self) = @_;
    $self->{toggleTimeHelper} = 'org::allbinary::time::TimeDelayHelper'->new(600);
    $self->{gameTickTimeDelayHelper} = 'org::allbinary::time::GameTickTimeDelayHelperFactory'->getInstance();
}


sub new {
    my ($class, $hashtable, $ownerLayerInterface, $gameInput) = @_;
    my $self = $class->SUPER::new($hashtable, $ownerLayerInterface, $gameInput);
    $self->_init_fields();
        # super(...) made $self above
        $self->update();
    return $self;
}


# throws Exception
sub processAI {
    my ($self, $allBinaryLayerManager) = @_;
}


# throws Exception
sub update {
    my ($self) = @_;
        my $gameInput = $self->getGameInput();
        my $keys = $self->{keys};
        my $size = scalar(@{$keys});
        if ($self->isOn()) {
            for (my $index = 0; $index < $size; $index++) {
                my $key = int($keys->[$index]);
                if ($key != -1) {
                    $gameInput->add($self->{gameKeyEventFactory}->getInstanceForKey($self, $key));
                }
            }
        } else {
            for (my $index = 0; $index < $size; $index++) {
                my $key = int($keys->[$index]);
                if ($key != -1) {
                    $gameInput->addForRemoval($self->{gameKeyEventFactory}->getInstanceForKey($self, $key));
                }
            }
        }
}


# throws Exception
sub toggle {
    my ($self) = @_;
        if ($self->{toggleTimeHelper}->isTime($self->{gameTickTimeDelayHelper}->{startTime})) {
            $self->SUPER::toggle();
            $self->update();
        }
}


# throws Exception
sub disable {
    my ($self) = @_;
        if ($self->{toggleTimeHelper}->isTime($self->{gameTickTimeDelayHelper}->{startTime})) {
            $self->SUPER::disable();
            $self->update();
        }
}


# throws Exception
sub enable {
    my ($self) = @_;
        if ($self->{toggleTimeHelper}->isTime($self->{gameTickTimeDelayHelper}->{startTime})) {
            $self->SUPER::enable();
            $self->update();
        }
}

use org::allbinary::game::input::GameInput;
use org::allbinary::layer::AllBinaryLayer;
use org::allbinary::layer::AllBinaryLayerManager;
use org::allbinary::time::GameTickTimeDelayHelper;
use org::allbinary::time::GameTickTimeDelayHelperFactory;
use org::allbinary::time::TimeDelayHelper;
use org::allbinary::util::ABHashtable;
use org::allbinary::game::ag::ai::KeyPressesAI;

1;

