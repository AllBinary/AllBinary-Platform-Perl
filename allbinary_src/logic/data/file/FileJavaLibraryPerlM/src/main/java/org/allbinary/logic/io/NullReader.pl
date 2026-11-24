# 
# AllBinary Open License Version 1 
# Copyright (c) 2025 AllBinary 
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

package org::allbinary::logic::io::NullReader;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'java::lang::Object';

tie our $NULL_READER, 'java::lang::LazyStatic', sub { 'org::allbinary::logic::io::NullReader'->new() };

sub new {
    my ($class) = @_;
    my $self = $class->SUPER::new();
    return $self;
}


# throws IOException
sub read_j0 {
    my ($self) = @_;
        return -1;
}


# throws IOException
sub read_j3 {
    my ($self, $cbuf, $off, $len) = @_;
        return -1;
}

sub read {
    my ($invocant, @arguments) = @_;
    return $invocant->read_j0(@arguments) if scalar(@arguments) == 0;
    return $invocant->read_j3(@arguments) if scalar(@arguments) == 3;
    die "No method read takes " . scalar(@arguments) . " arguments";
}


# throws IOException
sub ready {
    my ($self) = @_;
        return 0;
}


# throws IOException
sub skip {
    my ($self, $n) = @_;
        return 0;
}


sub close {
    my ($self) = @_;
}

use java::lang::Object ();
use java::lang::LazyStatic ();
# use java::io::IOException ();
# use java::io::Reader ();

1;

