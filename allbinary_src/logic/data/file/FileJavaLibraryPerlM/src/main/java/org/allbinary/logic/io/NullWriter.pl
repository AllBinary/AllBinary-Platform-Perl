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
sub write {
    my ($self, $c) = @_;
}


# throws IOException
# Java overloaded method: Perl keeps the last definition
sub write {
    my ($self, $cbuf, $off, $len) = @_;
}


# throws IOException
# Java overloaded method: Perl keeps the last definition
sub write {
    my ($self, $str) = @_;
}


# throws IOException
# Java overloaded method: Perl keeps the last definition
sub write {
    my ($self, $str, $off, $len) = @_;
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

