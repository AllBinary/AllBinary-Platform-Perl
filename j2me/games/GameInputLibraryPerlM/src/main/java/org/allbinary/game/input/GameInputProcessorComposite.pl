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

package org::allbinary::game::input::GameInputProcessorComposite;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::game::input::PlayerGameInput';


sub _init_fields {
    my ($self) = @_;
    $self->{name} = undef;
    $self->{gameInputProcessorInterface} = undef;
    $self->{NAME_LABEL} = " GameInputProcessorInterface: ";
}


sub new {
    my ($class, $name, $gameInputProcessorInterface) = @_;
    my $self = $class->SUPER::new('org::allbinary::util::BasicArrayListD'->new(), 'org::allbinary::util::BasicArrayListD'->new(), -1);
    $self->_init_fields();
        # super(...) made $self above
        $self->{name} = $name;
        $self->{gameInputProcessorInterface} = $gameInputProcessorInterface;
    return $self;
}


sub update {
    my ($self) = @_;
        try {
            my $list = $self->getGameKeyEventList();
            $self->{gameInputProcessorInterface}->onInput($list);
        } catch ($e) {
            $self->{logUtil}->put($self->{commonStrings}->{EXCEPTION}, $self, $self->{commonStrings}->{UPDATE}, $e);
        }
}


sub toString {
    my ($self) = @_;
        return 'org::allbinary::logic::string::StringMaker'->new()->append($self->SUPER::toString())->append($self->{NAME_LABEL})->append($self->{name})->toString();
}

use org::allbinary::logic::communication::log::LogUtil;
use org::allbinary::logic::string::StringMaker;
use org::allbinary::util::BasicArrayList;
use org::allbinary::util::BasicArrayListD;
use org::allbinary::game::input::PlayerGameInput;

1;

