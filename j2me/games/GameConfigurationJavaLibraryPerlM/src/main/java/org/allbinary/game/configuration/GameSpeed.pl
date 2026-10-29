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

package org::allbinary::game::configuration::GameSpeed;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';

our $instance = 'org::allbinary::game::configuration::GameSpeed'->new();

sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    return $self;
}


sub getSpeed {
    my ($self) = @_;
        my $speedGameConfiguration = 'org::allbinary::game::configuration::GameConfigurationCentral'->getInstance()->{SPEED};
        return (int($speedGameConfiguration->getMaxValue()) - int($speedGameConfiguration->getValue()) + 1);
}


sub getDelay {
    my ($self) = @_;
        my $speedGameConfiguration = 'org::allbinary::game::configuration::GameConfigurationCentral'->getInstance()->{SPEED};
        return 19 * (int($speedGameConfiguration->getMaxValue()) - int($speedGameConfiguration->getValue()));
}


sub getInstance {
    my ($class) = @_;
        return $org::allbinary::game::configuration::GameSpeed::instance;
}

use org::allbinary::game::configuration::GameConfigurationCentral;

1;

