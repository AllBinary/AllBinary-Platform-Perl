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

package org::allbinary::logic::io::AbFileInputStream;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'java::lang::Object';


sub _init_fields {
    my ($self) = @_;
    $self->{fileInputStream} = undef;
}


sub new {
    my ($class, $fileInputStream) = @_;
    my $self = $class->SUPER::new();
    _init_fields($self);
        $self->{fileInputStream} = $fileInputStream;
    return $self;
}


sub mark {
    my ($self, $readlimit) = @_;
        $self->{fileInputStream}->mark($readlimit);
}


sub markSupported {
    my ($self) = @_;
        return $self->{fileInputStream}->markSupported();
}


# throws IOException
sub reset {
    my ($self) = @_;
        $self->{fileInputStream}->reset();
}


# throws IOException
sub available {
    my ($self) = @_;
        return $self->{fileInputStream}->available();
}


# throws IOException
sub close {
    my ($self) = @_;
        $self->{fileInputStream}->close();
}


sub getChannel {
    my ($self) = @_;
        return $self->{fileInputStream}->getChannel();
}


# throws IOException
sub read_j0 {
    my ($self) = @_;
        return $self->{fileInputStream}->read();
}


# throws IOException
sub read_j1 {
    my ($self, $b) = @_;
        return $self->{fileInputStream}->read($b);
}


# throws IOException
sub read_j3 {
    my ($self, $buffer, $offset, $count) = @_;
        return $self->{fileInputStream}->read($buffer, $offset, $count);
}

sub read {
    my ($invocant, @arguments) = @_;
    return $invocant->read_j0(@arguments) if scalar(@arguments) == 0;
    return $invocant->read_j1(@arguments) if scalar(@arguments) == 1;
    return $invocant->read_j3(@arguments) if scalar(@arguments) == 3;
    die "No method read takes " . scalar(@arguments) . " arguments";
}


# throws IOException
sub skip {
    my ($self, $n) = @_;
        return $self->{fileInputStream}->skip($n);
}

use java::lang::Object ();
# use java::io::FileInputStream ();
# use java::io::FileNotFoundException ();
# use java::io::IOException ();
# use java::io::InputStream ();
# use java::nio::channels::FileChannel ();

1;

