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

package org::allbinary::game::configuration::feature::MainFeatureFactory;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';

our $instance = 'org::allbinary::game::configuration::feature::MainFeatureFactory'->new();

sub _init_fields {
    my ($self) = @_;
    $self->{FULL_SCREEN} = 'org::allbinary::game::configuration::feature::Feature'->new("Full Screen");
    $self->{TITLE_BAR} = 'org::allbinary::game::configuration::feature::Feature'->new("Title Bar");
    $self->{STATIC} = 'org::allbinary::game::configuration::feature::Feature'->new("Static Dependent Feature");
    $self->{LOAD_ONDEMAND} = 'org::allbinary::game::configuration::feature::Feature'->new("Load OnDemand");
    $self->{LOAD_ALL} = 'org::allbinary::game::configuration::feature::Feature'->new("Load All");
}

sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
    return $self;
}


sub getInstance {
    my ($class) = @_;
        return $org::allbinary::game::configuration::feature::MainFeatureFactory::instance;
}

use org::allbinary::game::configuration::feature::Feature;

1;

