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

package org::allbinary::game::input::KeyFactoryInitializer;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::init::Init';


sub _init_fields {
    my ($self) = @_;
    $self->{logUtil} = 'org::allbinary::logic::communication::log::LogUtil'->getInstance();
}

sub new {
    my ($class) = @_;
    my $self = $class->SUPER::new();
    $self->_init_fields();
    return $self;
}


sub init {
    my ($self) = @_;
        $self->{logUtil}->putF($self->{commonStrings}->{START}, $self, $self->{commonStrings}->{INIT});
        'org::allbinary::logic::math::SmallIntegerSingletonFactory'->getInstance()->initWithRange(0x2D0, 6);
}

use org::allbinary::init::Init;
use org::allbinary::logic::communication::log::LogUtil;
use org::allbinary::logic::math::SmallIntegerSingletonFactory;

1;

