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

package org::allbinary::game::ag::ai::KeyPressesAI;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::game::ai::BasicAI';


sub _init_fields {
    my ($self) = @_;
    $self->{on} = 1;
    $self->{keys} = undef;
}


sub new {
    my ($class, $hashtable, $ownerLayerInterface, $gameInput) = @_;
    my $self = $class->SUPER::new($ownerLayerInterface, $gameInput);
    $self->_init_fields();
        # super(...) made $self above
        $self->{keys} = [(undef) x ($hashtable->size())];
        my $objectArray = 'org::allbinary::util::HashtableUtil'->getInstance()->getKeysAsArray($hashtable);
        my $size = scalar(@{$objectArray});
        for (my $index = 0; $index < $size; $index++) {
            $self->{keys}->[$index] = $hashtable->get($objectArray->[$index]);
        }
    return $self;
}


# throws Exception
sub processAI {
    my ($self, $allBinaryLayerManager) = @_;
        if ($self->{on}) {
            for (my $index = 0; $index < scalar(@{$self->{keys}}); $index++) {
                $self->SUPER::processKeyAI(int($self->{keys}->[$index]));
            }
        }
}


# throws Exception
sub toggle {
    my ($self) = @_;
        if ($self->isOn()) {
            $self->setOn(0);
        } else {
            $self->setOn(1);
        }
}


# throws Exception
sub disable {
    my ($self) = @_;
        $self->setOn(0);
}


# throws Exception
sub enable {
    my ($self) = @_;
        $self->setOn(1);
}


sub setOn {
    my ($self, $on) = @_;
        $self->{on} = $on;
}


sub isOn {
    my ($self) = @_;
        return $self->{on};
}

use org::allbinary::game::input::GameInput;
use org::allbinary::layer::AllBinaryLayer;
use org::allbinary::layer::AllBinaryLayerManager;
use org::allbinary::util::HashtableUtil;
use org::allbinary::game::ai::BasicAI;
use org::allbinary::util::ABHashtable;

1;

