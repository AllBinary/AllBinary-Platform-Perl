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

package org::allbinary::business::quoterequest::QuoteRequestData;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';

our $instance = 'org::allbinary::business::quoterequest::QuoteRequestData'->new();

sub _init_fields {
    my ($self) = @_;
    $self->{ID} = "QUOTEREQUEST_ID";
    $self->{PROJECT_INFO} = "QUOTEREQUEST_PROJECT_INFO";
    $self->{CUSTOMER_COMMENTS} = "QUOTEREQUEST_CUSTOMER_COMMENTS";
    $self->{BUDGET} = "QUOTEREQUEST_BUDGET";
    $self->{TIMEFRAME} = "QUOTEREQUEST_TIMEFRAME";
    $self->{COMMENTS} = "QUOTEREQUEST_COMMENTS";
}


sub getInstance {
    my ($class) = @_;
        return $org::allbinary::business::quoterequest::QuoteRequestData::instance;
}


sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
    return $self;
}


1;

