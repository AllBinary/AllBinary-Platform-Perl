# Generated Code Do Not Modify

package org::allbinary::logic::util::cache::CacheTypeFactory;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'java::lang::Object';

tie our $instance, 'java::lang::LazyStatic', sub { 'org::allbinary::logic::util::cache::CacheTypeFactory'->new() };

sub _init_fields {
    my ($self) = @_;
    $self->{NO_CACHE} = 'org::allbinary::logic::util::cache::CacheType'->new('org::allbinary::logic::string::StringUtil'->getInstance()->{EMPTY_STRING}, 'org::allbinary::logic::string::StringUtil'->getInstance()->{EMPTY_STRING});
    $self->{CACHE} = 'org::allbinary::logic::util::cache::CacheType'->new('org::allbinary::logic::string::StringUtil'->getInstance()->{EMPTY_STRING}, 'org::allbinary::logic::string::StringUtil'->getInstance()->{EMPTY_STRING});
    $self->{SET} = 'org::allbinary::logic::util::cache::CacheType'->new('org::allbinary::logic::string::StringUtil'->getInstance()->{EMPTY_STRING}, "Set");
    $self->{CACHE_VECTOR} = 'org::allbinary::logic::util::cache::CacheType'->new('org::allbinary::logic::string::StringUtil'->getInstance()->{EMPTY_STRING}, 'org::allbinary::logic::string::StringUtil'->getInstance()->{EMPTY_STRING});
}

sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    _init_fields($self);
    return $self;
}


sub getInstance {
    my ($class) = @_;
        return $org::allbinary::logic::util::cache::CacheTypeFactory::instance;
}

use java::lang::Object ();
use java::lang::LazyStatic ();
use org::allbinary::logic::string::StringUtil ();
use org::allbinary::logic::util::cache::CacheType ();

1;

