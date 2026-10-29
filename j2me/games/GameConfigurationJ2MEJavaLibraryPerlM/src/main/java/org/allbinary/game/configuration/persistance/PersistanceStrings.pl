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

package org::allbinary::game::configuration::persistance::PersistanceStrings;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';

our $instance = 'org::allbinary::game::configuration::persistance::PersistanceStrings'->new();

sub _init_fields {
    my ($self) = @_;
    $self->{SAVING} = "Saving: ";
    $self->{NUMBER_OF_RECORDS} = "Number of records: ";
    $self->{LOADING_ID} = "Loading data with id: ";
    $self->{LOAD_ALL} = "loadAll";
    $self->{DELETING_WITH_ID} = "Deleting data with id: ";
    $self->{CLOSING_RECORDSTORE} = "Closing RecordStore";
    $self->{NOT_SAVING} = "Not Saving: ";
    $self->{ERROR_LOADING} = "Error Loading gameActionInput: ";
    $self->{ERROR_LOADING_ID} = "Error Loading id: ";
    $self->{ID} = " id: ";
    $self->{GAME_ACTION_INPUT} = " GameActionInput: ";
}

sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
    return $self;
}


sub getInstance {
    my ($class) = @_;
        return $org::allbinary::game::configuration::persistance::PersistanceStrings::instance;
}


1;

