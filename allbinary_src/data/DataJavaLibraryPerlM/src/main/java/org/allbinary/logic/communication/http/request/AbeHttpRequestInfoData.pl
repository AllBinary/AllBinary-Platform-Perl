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

package org::allbinary::logic::communication::http::request::AbeHttpRequestInfoData;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';

our $instance = 'org::allbinary::logic::communication::http::request::AbeHttpRequestInfoData'->new();

sub _init_fields {
    my ($self) = @_;
    $self->{HTTP_USER_AGENT} = "HTTP_USER_AGENT";
    $self->{REMOTE_ADDRESS} = "REMOTE_ADDRESS";
    $self->{REMOTE_HOST} = "REMOTE_HOST";
    $self->{REMOTE_HOST_BY_ADDRESS} = "REMOTE_HOST_BY_ADDRESS";
    $self->{REMOTE_PORT} = "REMOTE_PORT";
    $self->{REQUEST_FILE_PATH} = "REQUEST_FILE_PATH";
}


sub getInstance {
    my ($class) = @_;
        return $org::allbinary::logic::communication::http::request::AbeHttpRequestInfoData::instance;
}


sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
    return $self;
}


1;

