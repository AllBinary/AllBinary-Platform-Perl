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

package org::allbinary::game::midlet::LicenseLoadingTypeFactory;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';

our $instance = 'org::allbinary::game::midlet::LicenseLoadingTypeFactory'->new();

sub _init_fields {
    my ($self) = @_;
    $self->{INITIAL_LOADING} = 'org::allbinary::game::midlet::LicenseLoadingType'->new("Initial Loading");
    $self->{GAME_START} = 'org::allbinary::game::midlet::LicenseLoadingType'->new("Game Start");
    $self->{LOGIN} = 'org::allbinary::game::midlet::LicenseLoadingType'->new("Login");
    $self->{OTHER} = 'org::allbinary::game::midlet::LicenseLoadingType'->new("Other/Usually The First Non Demo Level");
}

sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
    return $self;
}


sub getIntance {
    my ($class) = @_;
        return $org::allbinary::game::midlet::LicenseLoadingTypeFactory::instance;
}

use org::allbinary::game::midlet::LicenseLoadingType;

1;

