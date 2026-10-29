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

package org::allbinary::game::configuration::persistance::GamePersistanceStrings;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';

our $instance = 'org::allbinary::game::configuration::persistance::GamePersistanceStrings'->new();

sub _init_fields {
    my ($self) = @_;
    $self->{SAVED_GAME_RECORD_ID} = "_SG";
    $self->{SAVED_GAME_CONFIGURATION_RECORD_ID} = "_SGC";
    $self->{DEFAULT_INPUT_MAPPING_RECORD_ID} = "_DIM";
    $self->{SAVED_INPUT_CONFIGURATION_RECORD_ID} = "_SIC";
}

sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
    return $self;
}


sub getInstance {
    my ($class) = @_;
        return $org::allbinary::game::configuration::persistance::GamePersistanceStrings::instance;
}


1;

