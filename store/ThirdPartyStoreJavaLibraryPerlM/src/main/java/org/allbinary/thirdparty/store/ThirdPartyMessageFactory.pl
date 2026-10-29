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

package org::allbinary::thirdparty::store::ThirdPartyMessageFactory;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';

our $instance = 'org::allbinary::thirdparty::store::ThirdPartyMessageFactory'->new();

sub _init_fields {
    my ($self) = @_;
    $self->{AUTHORIZED} = "Authorized";
    $self->{NOT_AUTHORIZED} = "Not Authorized";
    $self->{LINKAGE_ERROR} = "Linkage Error";
}

sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
    return $self;
}


sub getInstance {
    my ($class) = @_;
        return $org::allbinary::thirdparty::store::ThirdPartyMessageFactory::instance;
}


1;

