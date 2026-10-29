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

package org::allbinary::game::ag::ai::SpinnerAI;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::game::ai::BasicAI';


sub _init_fields {
    my ($self) = @_;
    $self->{isEven} = 0;
    $self->{direction} = undef;
}


sub new {
    my ($class, $direction, $ownerLayerInterface, $gameInput) = @_;
    my $self = $class->SUPER::new($ownerLayerInterface, $gameInput);
    $self->_init_fields();
        # super(...) made $self above
        $self->{direction} = $direction;
    return $self;
}


# throws Exception
sub processAI {
    my ($self, $allBinaryLayerManager) = @_;
        if ($self->{isEven}) {
            $self->SUPER::processKeyAI($self->{direction}->[0]);
            $self->{isEven} = 0;
        } else {
            $self->SUPER::processKeyAI($javax::microedition::lcdui::Canvas::KEY_NUM1);
            $self->{isEven} = 1;
        }
}

# use javax::microedition::lcdui::Canvas;
use org::allbinary::game::ai::BasicAI;
use org::allbinary::game::input::GameInput;
use org::allbinary::layer::AllBinaryLayer;
use org::allbinary::layer::AllBinaryLayerManager;

1;

