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

package org::allbinary::game::input::PlatformFormInputMappingFactory;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';

our $instance = 'org::allbinary::logic::NullUtil'->getInstance()->{NULL_OBJECT};

sub _init_fields {
    my ($self) = @_;
    $self->{logUtil} = 'org::allbinary::logic::communication::log::LogUtil'->getInstance();
    $self->{inputToGameKeyMapping} = 'org::allbinary::game::input::mapping::InputToGameKeyMapping'->getNullInstance();
}

sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
    return $self;
}


sub getInstance {
    my ($class) = @_;
        if ($org::allbinary::game::input::PlatformFormInputMappingFactory::instance == 'org::allbinary::logic::NullUtil'->getInstance()->{NULL_OBJECT}) {
            $org::allbinary::game::input::PlatformFormInputMappingFactory::instance = 'org::allbinary::game::input::PlatformFormInputMappingFactory'->new();
        }
        return $org::allbinary::game::input::PlatformFormInputMappingFactory::instance;
}


sub getOrCreate {
    my ($self) = @_;
        try {
            if ($self->{inputToGameKeyMapping} == 'org::allbinary::game::input::mapping::InputToGameKeyMapping'->getNullInstance()) {
                my $pcKeyFactory = 'org::allbinary::game::input::PCKeyFactory'->getInstance();
                my $inputToGameKeyMapping = 'org::allbinary::game::input::mapping::InputToGameKeyMapping'->new();
                my $gameKeyFactory = 'org::allbinary::game::input::GameKeyFactory'->getInstance();
                $inputToGameKeyMapping->add($gameKeyFactory->{UP}, $pcKeyFactory->{DPAD_UP});
                $inputToGameKeyMapping->add($gameKeyFactory->{DOWN}, $pcKeyFactory->{DPAD_DOWN});
                $inputToGameKeyMapping->add($gameKeyFactory->{LEFT}, $pcKeyFactory->{DPAD_LEFT});
                $inputToGameKeyMapping->add($gameKeyFactory->{RIGHT}, $pcKeyFactory->{DPAD_RIGHT});
                $inputToGameKeyMapping->add($gameKeyFactory->{KEY_NUM1}, $pcKeyFactory->{ENTER});
                $self->{inputToGameKeyMapping} = $inputToGameKeyMapping;
            }
        } catch ($e) {
            my $commonStrings = 'org::allbinary::string::CommonStrings'->getInstance();
            $self->{logUtil}->put($commonStrings->{EXCEPTION}, $self, $commonStrings->{GET_INSTANCE}, $e);
        }
        return $self->{inputToGameKeyMapping};
}

use org::allbinary::game::input::mapping::InputToGameKeyMapping;
use org::allbinary::logic::NullUtil;
use org::allbinary::logic::communication::log::LogUtil;
use org::allbinary::string::CommonStrings;
use org::allbinary::game::input::PCKeyFactory;
use org::allbinary::game::input::GameKeyFactory;

1;

