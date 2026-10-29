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

package org::allbinary::input::motion::button::TouchScreenFactory;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';

our $SINGLETON = 'org::allbinary::input::motion::button::TouchScreenFactory'->new();

sub _init_fields {
    my ($self) = @_;
    $self->{multiTouch} = 0;
    $self->{touch} = 0;
    $self->{touchScreenType} = 'org::allbinary::input::motion::button::TouchScreenTypesFactory'->getInstance()->{NOTOUCH};
}


sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
    return $self;
}


sub getInstance {
    my ($class) = @_;
        return $org::allbinary::input::motion::button::TouchScreenFactory::SINGLETON;
}


sub isMultiTouch {
    my ($self) = @_;
        return $self->{multiTouch};
}


sub setTouch {
    my ($self, $touch) = @_;
}


sub isTouch {
    my ($self) = @_;
        return $self->{touch};
}


sub getTouchScreenType {
    my ($self) = @_;
        return $self->{touchScreenType};
}

use org::allbinary::input::motion::button::TouchScreenTypesFactory;

1;

