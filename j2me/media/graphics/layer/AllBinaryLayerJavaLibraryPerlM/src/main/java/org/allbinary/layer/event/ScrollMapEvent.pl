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

package org::allbinary::layer::event::ScrollMapEvent;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::logic::util::event::AllBinaryEventObject';


sub _init_fields {
    my ($self) = @_;
    $self->{dx} = 0;
    $self->{dy} = 0;
}


sub new {
    my ($class, $anyType) = @_;
    my $self = $class->SUPER::new($anyType);
    $self->_init_fields();
        # super(...) made $self above
    return $self;
}


sub setDx {
    my ($self, $dx) = @_;
        $self->{dx} = $dx;
}


sub getDx {
    my ($self) = @_;
        return $self->{dx};
}


sub setDy {
    my ($self, $dy) = @_;
        $self->{dy} = $dy;
}


sub getDy {
    my ($self) = @_;
        return $self->{dy};
}


sub setDxDy {
    my ($self, $dx, $dy) = @_;
        $self->{dx} = $dx;
        $self->{dy} = $dy;
}

use org::allbinary::logic::util::event::AllBinaryEventObject;

1;

