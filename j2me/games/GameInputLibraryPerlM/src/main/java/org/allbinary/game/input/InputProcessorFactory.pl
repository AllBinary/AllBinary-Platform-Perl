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

package org::allbinary::game::input::InputProcessorFactory;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';

our $instance = 'org::allbinary::game::input::InputProcessorFactory'->new();

sub _init_fields {
    my ($self) = @_;
    $self->{inputProcessor} = 'org::allbinary::game::input::InputProcessor'->new();
}

sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
    return $self;
}


sub getInstance {
    my ($class) = @_;
        return $org::allbinary::game::input::InputProcessorFactory::instance;
}


sub getInputProcessor {
    my ($self) = @_;
        return $self->{inputProcessor};
}

use org::allbinary::game::input::InputProcessor;

1;

