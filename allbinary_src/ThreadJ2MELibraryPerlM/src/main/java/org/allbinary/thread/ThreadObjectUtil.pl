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
        $anyType->notify();
}


# throws Exception
sub waitObject {
    my ($self, $anyType) = @_;
        $anyType->wait();
}


# throws Exception
sub waitObjectFor {
    my ($self, $anyType, $delay) = @_;
        'org::allbinary::TsUtil'->getInstance()->waitFor($anyType, $delay);
}


sub processThread {
    my ($self, $runnable) = @_;
        my $thread = 'java::lang::Thread'->new($runnable);
        $thread->start();
}

use java::lang::Object ();
use java::lang::LazyStatic ();
use org::allbinary::TsUtil ();
use org::allbinary::thread::NullPriorityRunnable ();
use java::lang::Thread ();

1;

