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

package org::allbinary::logic::util::cache::CachePolicyFactory;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';

our $instance = 'org::allbinary::logic::util::cache::CachePolicyFactory'->new();

sub _init_fields {
    my ($self) = @_;
    $self->{NAME} = "lru";
    $self->{MAX_TIME_THOUSAND_MAX} = 'org::allbinary::logic::util::cache::CachePolicy'->new($self->{NAME}, 9223372036854775807, 1000);
    $self->{THIRTY_MINUTES_TEN_THOUSAND_MAX} = 'org::allbinary::logic::util::cache::CachePolicy'->new($self->{NAME}, 1000 * 60 * 30, 10000);
    $self->{THIRTY_MINUTES_FIFTY_THOUSAND_MAX} = 'org::allbinary::logic::util::cache::CachePolicy'->new($self->{NAME}, 1000 * 60 * 30, 100000);
    $self->{ONE_MINUTE_FIVE_MAX} = 'org::allbinary::logic::util::cache::CachePolicy'->new($self->{NAME}, 1000 * 60 * 1, 5);
    $self->{ONE_MINUTE_TEN_MAX} = 'org::allbinary::logic::util::cache::CachePolicy'->new($self->{NAME}, 1000 * 60 * 1, 10);
    $self->{ONE_MINUTE_ONE_HUNDRED_MAX} = 'org::allbinary::logic::util::cache::CachePolicy'->new($self->{NAME}, 1000 * 60 * 1, 100);
}

sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
    return $self;
}


sub getInstance {
    my ($class) = @_;
        return $org::allbinary::logic::util::cache::CachePolicyFactory::instance;
}

use org::allbinary::logic::util::cache::CachePolicy;

1;

