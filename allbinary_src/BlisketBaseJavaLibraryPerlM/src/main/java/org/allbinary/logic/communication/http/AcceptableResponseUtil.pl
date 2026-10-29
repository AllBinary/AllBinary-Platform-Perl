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

package org::allbinary::logic::communication::http::AcceptableResponseUtil;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';

our $instance = 'org::allbinary::logic::communication::http::AcceptableResponseUtil'->new();

sub _init_fields {
    my ($self) = @_;
    $self->{candidateVector} = 'org::allbinary::util::BasicArrayListD'->new();
    $self->{tagNameVector} = 'org::allbinary::util::BasicArrayListD'->new();
}

sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
    return $self;
}


sub getInstance {
    my ($class) = @_;
        return $org::allbinary::logic::communication::http::AcceptableResponseUtil::instance;
}


{ # Java static initializer
        'org::allbinary::TsUtil'->getInstance()->hashCode('org::allbinary::logic::communication::http::AcceptableResponseFactory'->getInstance()->{HTML});
}


sub get {
    my ($self, $index) = @_;
        return $self->{candidateVector}->get($index);
}


sub getTagName {
    my ($self, $index) = @_;
        return $self->{tagNameVector}->get($index);
}


sub size {
    my ($self) = @_;
        return $self->{candidateVector}->size();
}

use org::allbinary::util::BasicArrayList;
use org::allbinary::util::BasicArrayListD;
use org::allbinary::TsUtil;
use org::allbinary::logic::StdUtil;
use org::allbinary::logic::communication::http::AcceptableResponseFactory;

1;

