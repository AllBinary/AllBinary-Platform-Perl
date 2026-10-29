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

package org::allbinary::game::combat::destroy::event::DestroyEventFactory;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::logic::util::event::AllBinaryEventObjectFactoryInterface';


sub _init_fields {
    my ($self) = @_;
    $self->{combatGameCanvas} = undef;
}


sub new {
    my ($class, $combatGameCanvas) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
        $self->{combatGameCanvas} = $combatGameCanvas;
    return $self;
}


sub getInstance {
    my ($self) = @_;
        return 'org::allbinary::game::combat::destroy::event::DestroyedEvent'->new($self->{combatGameCanvas});
}

use org::allbinary::game::displayable::canvas::AllBinaryGameCanvas;
use org::allbinary::logic::util::event::AllBinaryEventObject;
use org::allbinary::logic::util::event::AllBinaryEventObjectFactoryInterface;
use org::allbinary::game::combat::destroy::event::DestroyedEvent;

1;

