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

package org::allbinary::game::input::event::GameKeyEvent;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::logic::util::event::AllBinaryEventObject';

our $NONE = 'org::allbinary::game::input::event::GameKeyEvent'->new('org::allbinary::logic::NullUtil'->getInstance()->{NULL_OBJECT}, -1, -1, -1, -1, 0);

sub _init_fields {
    my ($self) = @_;
    $self->{sourceId} = undef;
    $self->{repeated} = 0;
    $self->{key} = undef;
    $self->{gameActionKey} = 0;
    $self->{originalKey} = 0;
}


sub createEvent {
    my ($class, $anyType, $sourceId, $key) = @_;
        return 'org::allbinary::game::input::event::GameKeyEvent'->new($anyType, $sourceId, 0, 0, $key, 0);
}


sub new {
    my ($class, $anyType, $sourceId, $originalKey, $gameActionKey, $key, $repeated) = @_;
    my $self = $class->SUPER::new($anyType);
    $self->_init_fields();
        # super(...) made $self above
        $self->{sourceId} = $sourceId;
        $self->setOriginalKey($originalKey);
        $self->{key} = $key;
        $self->setGameActionKey($gameActionKey);
        $self->setRepeatEvents($repeated);
    return $self;
}


sub init {
    my ($self, $anyType) = @_;
        $self->setSource($anyType);
}


sub setRepeatEvents {
    my ($self, $repeated) = @_;
        $self->{repeated} = $repeated;
}


sub hasRepeatEvents {
    my ($self) = @_;
        return $self->{repeated};
}


sub getKey {
    my ($self) = @_;
        return $self->{key};
}


sub toString {
    my ($self) = @_;
        my $stringBuffer = 'org::allbinary::logic::string::StringMaker'->new();
        $stringBuffer->append("\nKey: ");
        $stringBuffer->appendint($self->getKey());
        return $stringBuffer->toString();
}


sub getOriginalKey {
    my ($self) = @_;
        return $self->{originalKey};
}


sub setOriginalKey {
    my ($self, $originalKey) = @_;
        $self->{originalKey} = $originalKey;
}


sub getGameActionKey {
    my ($self) = @_;
        return $self->{gameActionKey};
}


sub setGameActionKey {
    my ($self, $gameActionKey) = @_;
        $self->{gameActionKey} = $gameActionKey;
}


sub getSourceId {
    my ($self) = @_;
        return $self->{sourceId};
}

use org::allbinary::logic::NullUtil;
use org::allbinary::logic::string::StringMaker;
use org::allbinary::logic::util::event::AllBinaryEventObject;

1;

