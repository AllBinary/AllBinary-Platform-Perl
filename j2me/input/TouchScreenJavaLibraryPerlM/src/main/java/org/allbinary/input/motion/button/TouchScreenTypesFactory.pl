# 
# AllBinary Open License Version 1 
# Copyright (c) 2025 AllBinary 
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

package org::allbinary::input::motion::button::TouchScreenTypesFactory;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';

our $instance = 'org::allbinary::input::motion::button::TouchScreenTypesFactory'->new();

sub _init_fields {
    my ($self) = @_;
    $self->{FINGER} = 'org::allbinary::input::motion::button::TouchScreenType'->new("Finger");
    $self->{NOTOUCH} = 'org::allbinary::input::motion::button::TouchScreenType'->new("No Touch");
    $self->{STYLUS} = 'org::allbinary::input::motion::button::TouchScreenType'->new("Stylus");
    $self->{UNDEFINED} = 'org::allbinary::input::motion::button::TouchScreenType'->new("Undefined");
}

sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
    return $self;
}


sub getInstance {
    my ($class) = @_;
        return $org::allbinary::input::motion::button::TouchScreenTypesFactory::instance;
}

use org::allbinary::input::motion::button::TouchScreenType;

1;

