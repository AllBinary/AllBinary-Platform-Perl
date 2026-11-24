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

package org::allbinary::logic::io::NullOutputStream;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'java::lang::Object';

tie our $NULL_OUTPUT_STREAM, 'java::lang::LazyStatic', sub { 'org::allbinary::logic::io::NullOutputStream'->new() };

sub new {
    my ($class) = @_;
    my $self = $class->SUPER::new();
    return $self;
}


# throws IOException
sub write_j1 {
    my ($self, $b) = @_;
}


# throws IOException
sub write_j3 {
    my ($self, $b, $off, $len) = @_;
}

sub write {
    my ($invocant, @arguments) = @_;
    return $invocant->write_j1(@arguments) if scalar(@arguments) == 1;
    return $invocant->write_j3(@arguments) if scalar(@arguments) == 3;
    die "No method write takes " . scalar(@arguments) . " arguments";
}


sub close {
    my ($self) = @_;
}

use java::lang::Object ();
use java::lang::LazyStatic ();
# use java::io::IOException ();
# use java::io::OutputStream ();

1;

