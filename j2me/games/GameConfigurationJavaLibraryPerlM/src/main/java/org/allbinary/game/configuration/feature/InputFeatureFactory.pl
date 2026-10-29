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

package org::allbinary::game::configuration::feature::InputFeatureFactory;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';

our $instance = 'org::allbinary::game::configuration::feature::InputFeatureFactory'->new();

sub _init_fields {
    my ($self) = @_;
    $self->{REMOVE_DUPLICATE_KEY_PRESSES} = 'org::allbinary::game::configuration::feature::InputFeature'->new("Remove Duplicate Key Presses");
    $self->{INPUT_MAPPING} = 'org::allbinary::game::configuration::feature::InputFeature'->new("Input Mapping");
    $self->{MULTI_KEY_PRESS} = 'org::allbinary::game::configuration::feature::InputFeature'->new("Multi Key Press");
    $self->{SINGLE_KEY_REPEAT_PRESS} = 'org::allbinary::game::configuration::feature::InputFeature'->new("Single Key Repeat Press");
    $self->{SINGLE_KEY_PRESS} = 'org::allbinary::game::configuration::feature::InputFeature'->new("Single Key Press");
}


sub getInstance {
    my ($class) = @_;
        return $org::allbinary::game::configuration::feature::InputFeatureFactory::instance;
}


sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
    return $self;
}


sub isSingleKeyProcessing {
    my ($self) = @_;
        my $features = 'org::allbinary::game::configuration::feature::Features'->getInstance();
        if ($features->isFeature($self->{SINGLE_KEY_REPEAT_PRESS}) || $features->isFeature($self->{SINGLE_KEY_PRESS})) {
            return 1;
        } else {
            return 0;
        }
}

use org::allbinary::game::configuration::feature::InputFeature;
use org::allbinary::game::configuration::feature::Features;

1;

