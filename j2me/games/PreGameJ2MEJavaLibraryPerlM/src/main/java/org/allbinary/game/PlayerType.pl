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

package org::allbinary::game::PlayerType;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'java::lang::Object';


sub _init_fields {
    my ($self) = @_;
    $self->{id} = undef;
    $self->{name} = 'org::allbinary::logic::string::StringUtil'->getInstance()->{EMPTY_STRING};
}


sub new {
    my ($class, $name, $value) = @_;
    my $self = bless({}, $class);
    _init_fields($self);
        $self->{name} = $name;
        $self->{id} = $value;
    return $self;
}


sub getId {
    my ($self) = @_;
        return $self->{id};
}


sub getName {
    my ($self) = @_;
        return $self->{name};
}


sub toString {
    my ($self) = @_;
        return $self->getName();
}

use java::lang::Object ();
use org::allbinary::logic::string::StringUtil ();

1;

