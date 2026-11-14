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

package org::allbinary::business::context::modules::storefront::StoreFrontsData;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'java::lang::Object';

tie our $instance, 'java::lang::LazyStatic', sub { 'org::allbinary::business::context::modules::storefront::StoreFrontsData'->new() };

sub _init_fields {
    my ($self) = @_;
    $self->{TYPE} = "STOREFRONTS_TYPE";
    $self->{RETAIL} = "STOREFRONTS_RETAIL";
    $self->{SUBSCRIPTION} = "STOREFRONTS_SUBSCRIPTION";
    $self->{AUCTION} = "STOREFRONTS_AUCTION";
    $self->{NEWS} = "STOREFRONTS_NEWS";
    $self->{BLOG} = "STOREFRONTS_BLOG";
    $self->{FORUM} = "STOREFRONTS_FORUM";
}

sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    _init_fields($self);
    return $self;
}


sub getInstance {
    my ($class) = @_;
        return $org::allbinary::business::context::modules::storefront::StoreFrontsData::instance;
}

use java::lang::Object ();
use java::lang::LazyStatic ();

1;

