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

package org::allbinary::game::input::PlatformInputMappingFactory;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';

our $instance = 'org::allbinary::game::input::PlatformInputMappingFactory'->new();

sub _init_fields {
    my ($self) = @_;
    $self->{logUtil} = 'org::allbinary::logic::communication::log::LogUtil'->getInstance();
    $self->{inputToGameKeyMapping} = 'org::allbinary::game::input::mapping::PersistentInputMapping'->getNullInstance();
}

sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
    return $self;
}


sub getInstance {
    my ($class) = @_;
        return $org::allbinary::game::input::PlatformInputMappingFactory::instance;
}


sub getPersistentInputMappingInstance {
    my ($self) = @_;
        try {
            if ($self->{inputToGameKeyMapping} == 'org::allbinary::game::input::mapping::PersistentInputMapping'->getNullInstance()) {
                $self->{inputToGameKeyMapping} = 'org::allbinary::game::input::LaptopGameInputMapping'->new();
            }
        } catch ($e) {
            my $commonStrings = 'org::allbinary::string::CommonStrings'->getInstance();
            $self->{logUtil}->put($commonStrings->{EXCEPTION}, $self, $commonStrings->{GET_INSTANCE}, $e);
        }
        return $self->{inputToGameKeyMapping};
}

use org::allbinary::game::input::mapping::PersistentInputMapping;
use org::allbinary::logic::communication::log::LogUtil;
use org::allbinary::string::CommonStrings;
use org::allbinary::game::input::LaptopGameInputMapping;

1;

