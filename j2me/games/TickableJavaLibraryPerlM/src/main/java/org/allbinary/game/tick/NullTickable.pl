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

package org::allbinary::game::tick::NullTickable;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::game::tick::TickableInterface';

our $SINGLETON = 'org::allbinary::game::tick::NullTickable'->new();

sub _init_fields {
    my ($self) = @_;
    $self->{NAME} = "NulLTickable";
}

sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
    return $self;
}


sub getInstance {
    my ($class) = @_;
        return $org::allbinary::game::tick::NullTickable::SINGLETON;
}


# throws Exception
sub processTick {
    my ($self, $allBinaryLayerManager) = @_;
}


sub getName {
    my ($self) = @_;
        return $self->{NAME};
}

use org::allbinary::layer::AllBinaryLayerManager;
use org::allbinary::game::tick::TickableInterface;

1;

