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

package org::allbinary::logic::system::hardware::HardwareFactory;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'java::lang::Object';

tie our $instance, 'java::lang::LazyStatic', sub { 'org::allbinary::logic::system::hardware::HardwareFactory'->new() };

sub _init_fields {
    my ($self) = @_;
    $self->{SINGLETON} = java::lang::Object::jstatic('org::allbinary::logic::system::hardware::HardwareFactory', 'NoHardware')->getInstance();
}


sub getInstance_j0 {
    my ($class) = @_;
        return $org::allbinary::logic::system::hardware::HardwareFactory::instance;
}


sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    _init_fields($self);
    return $self;
}


# throws Exception
sub getInstance_j1 {
    my ($self, $os) = @_;
        try {
            return $self->{SINGLETON};
        } catch ($e) {
            die $e;
        }
}

sub getInstance {
    my ($invocant, @arguments) = @_;
    return $invocant->getInstance_j0(@arguments) if scalar(@arguments) == 0;
    return $invocant->getInstance_j1(@arguments) if scalar(@arguments) == 1;
    die "No method getInstance takes " . scalar(@arguments) . " arguments";
}

use java::lang::Object ();
use java::lang::LazyStatic ();
use org::allbinary::logic::system::os::OperatingSystemInterface ();

1;

