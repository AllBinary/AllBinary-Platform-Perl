# Generated Code Do Not Modify

package org::allbinary::thread::ThreadObjectUtil;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'java::lang::Object';

tie our $instance, 'java::lang::LazyStatic', sub { 'org::allbinary::thread::ThreadObjectUtil'->new() };

sub _init_fields {
    my ($self) = @_;
    $self->{NULL_PRIORITY_RUNNABLE} = 'org::allbinary::thread::NullPriorityRunnable'->new();
}

sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    _init_fields($self);
    return $self;
}


sub getInstance {
    my ($class) = @_;
        return $org::allbinary::thread::ThreadObjectUtil::instance;
}


sub notifyObject {
    my ($self, $anyType) = @_;
}


# throws Exception
sub waitObject {
    my ($self, $anyType) = @_;
}


# throws Exception
sub waitObjectFor {
    my ($self, $anyType, $delay) = @_;
}


sub processThread {
    my ($self, $runnable) = @_;
        $runnable->run();
}

use java::lang::Object ();
use java::lang::LazyStatic ();
use org::allbinary::thread::NullPriorityRunnable ();

1;

