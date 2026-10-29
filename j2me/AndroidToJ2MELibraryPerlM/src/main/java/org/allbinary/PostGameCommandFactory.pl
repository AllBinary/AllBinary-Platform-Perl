# 
# AllBinary Open License Version 1 
# Copyright (c) 2022 AllBinary 
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

package org::allbinary::PostGameCommandFactory;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';

our $instance = 'org::allbinary::PostGameCommandFactory'->new();

sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    return $self;
}


sub getInstance {
    my ($class) = @_;
        return $org::allbinary::PostGameCommandFactory::instance;
}


sub addCommands {
    my ($self, $canvas) = @_;
        my $operatingSystemInterface = 'org::allbinary::logic::system::os::OperatingSystemFactory'->getInstance()->getOperatingSystemInstance();
        my $gameCommandsFactory = 'org::allbinary::game::commands::GameCommandsFactory'->getInstance();
        if (!$operatingSystemInterface->isOverScan()) {
            $canvas->addCommand($gameCommandsFactory->{TOGGLE_KEYBOARD});
        }
        'org::allbinary::game::configuration::feature::MultiPlayerGameFeatureFactory'->getInstance()->addCommands($canvas);
}

use org::allbinary::game::commands::GameCommandsFactory;
use org::allbinary::game::configuration::feature::MultiPlayerGameFeatureFactory;
use org::allbinary::graphics::displayable::MyCanvas;
use org::allbinary::logic::system::os::GenericOperatingSystem;
use org::allbinary::logic::system::os::OperatingSystemFactory;

1;

