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

package org::allbinary::logic::communication::log::config::type::LogConfigType;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'java::lang::Object';

tie our $availableLogConfigTypes, 'java::lang::LazyStatic', sub { 'org::allbinary::util::BasicArrayListD'->new() };

sub _init_fields {
    my ($self) = @_;
    $self->{logUtil} = 'org::allbinary::logic::communication::log::LogUtil'->getInstance();
    $self->{name} = undef;
    $self->{description} = undef;
}


sub new {
    my ($class, $name, $description) = @_;
    my $self = bless({}, $class);
    _init_fields($self);
        $self->{name} = $name;
        $self->{description} = $description;
        $org::allbinary::logic::communication::log::config::type::LogConfigType::availableLogConfigTypes->add($self);
    return $self;
}


sub getName {
    my ($self) = @_;
        return $self->{name};
}


sub getDescription {
    my ($self) = @_;
        return $self->{description};
}


sub setName {
    my ($self, $value) = @_;
        $self->{name} = $value;
}


sub setDescription {
    my ($self, $value) = @_;
        $self->{description} = $value;
}

use java::lang::Object ();
use java::lang::LazyStatic ();
use org::allbinary::logic::communication::log::LogUtil ();
use org::allbinary::util::BasicArrayList ();
use org::allbinary::util::BasicArrayListD ();

1;

