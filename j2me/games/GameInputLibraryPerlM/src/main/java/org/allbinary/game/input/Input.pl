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

package org::allbinary::game::input::Input;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';


sub _init_fields {
    my ($self) = @_;
    $self->{id} = 0;
    $self->{name} = 'org::allbinary::logic::string::StringUtil'->getInstance()->{EMPTY_STRING};
}


sub new {
    my ($class, $id, $name) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
        $self->setId($id);
        $self->setName($name);
    return $self;
}


sub getId {
    my ($self) = @_;
        return $self->{id};
}


sub setId {
    my ($self, $key) = @_;
        $self->{id} = $key;
}


sub getName {
    my ($self) = @_;
        return $self->{name};
}


sub setName {
    my ($self, $keyName) = @_;
        $self->{name} = $keyName;
}


sub toString {
    my ($self) = @_;
        my $stringBuffer = 'org::allbinary::logic::string::StringMaker'->new();
        $stringBuffer->append("Name: ");
        $stringBuffer->append($self->getName());
        $stringBuffer->append(" Id: ");
        $stringBuffer->appendint($self->getId());
        return $stringBuffer->toString();
}

use org::allbinary::logic::string::StringMaker;
use org::allbinary::logic::string::StringUtil;

1;

