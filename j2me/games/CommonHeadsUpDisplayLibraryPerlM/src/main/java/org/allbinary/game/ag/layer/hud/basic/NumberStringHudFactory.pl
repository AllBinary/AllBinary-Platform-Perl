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

package org::allbinary::game::ag::layer::hud::basic::NumberStringHudFactory;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';

our $instance = 'org::allbinary::logic::NullUtil'->getInstance();

sub _init_fields {
    my ($self) = @_;
    $self->{NULL_NUMBER_STRING_HUD} = $self->createHud();
}

sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
    return $self;
}


sub getInstance {
    my ($class) = @_;
        if ($org::allbinary::game::ag::layer::hud::basic::NumberStringHudFactory::instance == 'org::allbinary::logic::NullUtil'->getInstance()) {
            $org::allbinary::game::ag::layer::hud::basic::NumberStringHudFactory::instance = 'org::allbinary::game::ag::layer::hud::basic::NumberStringHudFactory'->new();
        }
        return $org::allbinary::game::ag::layer::hud::basic::NumberStringHudFactory::instance;
}


sub createHud {
    my ($self) = @_;
        try {
            return 'org::allbinary::game::ag::layer::hud::basic::NumberStringHud'->new('org::allbinary::logic::string::StringUtil'->getInstance()->{EMPTY_STRING}, 9, 'org::allbinary::game::graphics::hud::BasicHudFactory'->getInstance()->{ABSOLUTE}, 1, 0, 'org::allbinary::graphics::color::BasicColorFactory'->getInstance()->{NULL_COLOR});
        } catch ($e) {
            my $logUtil = 'org::allbinary::logic::communication::log::LogUtil'->getInstance();
            my $commonStrings = 'org::allbinary::string::CommonStrings'->getInstance();
            $logUtil->put($commonStrings->{EXCEPTION}, $self, $commonStrings->{CONSTRUCTOR}, $e);
            die ("RuntimeException");
        }
}

use org::allbinary::game::graphics::hud::BasicHudFactory;
use org::allbinary::graphics::color::BasicColorFactory;
use org::allbinary::logic::NullUtil;
use org::allbinary::logic::communication::log::LogUtil;
use org::allbinary::logic::string::StringUtil;
use org::allbinary::string::CommonStrings;
use org::allbinary::game::ag::layer::hud::basic::NumberStringHud;

1;

