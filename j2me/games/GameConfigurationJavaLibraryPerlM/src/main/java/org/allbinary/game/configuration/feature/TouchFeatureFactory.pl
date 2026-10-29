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

package org::allbinary::game::configuration::feature::TouchFeatureFactory;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';

our $instance = 'org::allbinary::game::configuration::feature::TouchFeatureFactory'->new();

sub _init_fields {
    my ($self) = @_;
    $self->{TOUCH_ENABLED} = 'org::allbinary::game::configuration::feature::TouchFeature'->new("Touch Enabled");
    $self->{SHOW_SCREEN_BUTTONS} = 'org::allbinary::game::configuration::feature::TouchFeature'->new("Show");
    $self->{AUTO_HIDE_SHOW_SCREEN_BUTTONS} = 'org::allbinary::game::configuration::feature::TouchFeature'->new("Auto Hide (One Level)");
    $self->{HIDE_SCREEN_BUTTONS} = 'org::allbinary::game::configuration::feature::TouchFeature'->new("Hide");
}


sub getInstance {
    my ($class) = @_;
        return $org::allbinary::game::configuration::feature::TouchFeatureFactory::instance;
}


sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
    return $self;
}

use org::allbinary::game::configuration::feature::TouchFeature;

1;

