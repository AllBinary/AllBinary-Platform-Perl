# Generated Code Do Not Modify

package org::allbinary::logic::util::cache::PoolTypeFactory;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';

our $instance = 'org::allbinary::logic::util::cache::PoolTypeFactory'->new();

sub _init_fields {
    my ($self) = @_;
    $self->{VECTOR_POOL} = 'org::allbinary::logic::util::cache::PoolType'->new('org::allbinary::logic::util::cache::CacheTypeFactory'->getInstance()->{NO_CACHE});
}

sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
    return $self;
}


sub getInstance {
    my ($class) = @_;
        return $org::allbinary::logic::util::cache::PoolTypeFactory::instance;
}

use org::allbinary::logic::util::cache::PoolType;
use org::allbinary::logic::util::cache::CacheTypeFactory;

1;

