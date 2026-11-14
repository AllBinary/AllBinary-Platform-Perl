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

package org::allbinary::game::GameMode;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'java::lang::Object';

tie our $NONE, 'java::lang::LazyStatic', sub { 'org::allbinary::game::GameMode'->new('org::allbinary::logic::string::StringUtil'->getInstance()->{NULL_STRING}) };
tie our $SERVER, 'java::lang::LazyStatic', sub { 'org::allbinary::game::GameMode'->new("Server") };
tie our $CLIENT, 'java::lang::LazyStatic', sub { 'org::allbinary::game::GameMode'->new("Client") };

sub _init_fields {
    my ($self) = @_;
    $self->{name} = 'org::allbinary::logic::string::StringUtil'->getInstance()->{EMPTY_STRING};
}


sub new {
    my ($class, $name) = @_;
    my $self = bless({}, $class);
    _init_fields($self);
        $self->setName($name);
    return $self;
}


sub setName {
    my ($self, $name) = @_;
        $self->{name} = $name;
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
use java::lang::LazyStatic ();
use org::allbinary::logic::string::StringUtil ();

1;

