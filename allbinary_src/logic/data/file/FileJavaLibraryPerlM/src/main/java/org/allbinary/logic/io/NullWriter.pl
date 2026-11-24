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

package org::allbinary::logic::io::NullWriter;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'java::lang::Object';

tie our $NULL_WRITER, 'java::lang::LazyStatic', sub { 'org::allbinary::logic::io::NullWriter'->new() };

sub new {
    my ($class) = @_;
    my $self = $class->SUPER::new();
    return $self;
}


# throws IOException
sub write_j1_1 {
    my ($self, $c) = @_;
}


# throws IOException
sub write_j3_1 {
    my ($self, $cbuf, $off, $len) = @_;
}


# throws IOException
sub write_j1_2 {
    my ($self, $str) = @_;
}


# throws IOException
sub write_j3_2 {
    my ($self, $str, $off, $len) = @_;
}

sub write {
    my ($invocant, @arguments) = @_;
    return $invocant->write_j1(@arguments) if scalar(@arguments) == 1;
    return $invocant->write_j3(@arguments) if scalar(@arguments) == 3;
    die "No method write takes " . scalar(@arguments) . " arguments";
}

sub write_j1 {
    my ($invocant, @arguments) = @_;
    return $invocant->write_j1_1(@arguments) if 1 && !ref($arguments[0]);
    return $invocant->write_j1_2(@arguments);
}

sub write_j3 {
    my ($invocant, @arguments) = @_;
    return $invocant->write_j3_1(@arguments) if 1 && (!defined($arguments[0]) || ref($arguments[0]) eq 'ARRAY') && !ref($arguments[1]) && !ref($arguments[2]);
    return $invocant->write_j3_2(@arguments);
}


# throws IOException
sub flush {
    my ($self) = @_;
}


# throws IOException
sub close {
    my ($self) = @_;
}

use java::lang::Object ();
use java::lang::LazyStatic ();
# use java::io::IOException ();
# use java::io::Writer ();

1;

