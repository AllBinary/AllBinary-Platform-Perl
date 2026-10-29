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
use parent -norequire,'java::io::InputStream';


sub _init_fields {
    my ($self) = @_;
    $self->{fileInputStream} = undef;
}


sub new {
    my ($class, $fileInputStream) = @_;
    my $self = $class->SUPER::new();
    $self->_init_fields();
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
sub read {
    my ($self) = @_;
        return $self->{fileInputStream}->read();
}


# throws IOException
# Java overloaded method: Perl keeps the last definition
sub read {
    my ($self, $b) = @_;
        return $self->{fileInputStream}->read($b);
}


# throws IOException
# Java overloaded method: Perl keeps the last definition
sub read {
    my ($self, $buffer, $offset, $count) = @_;
        return $self->{fileInputStream}->read($buffer, $offset, $count);
}


# throws IOException
sub skip {
    my ($self, $n) = @_;
        return $self->{fileInputStream}->skip($n);
}

# use java::io::FileInputStream;
# use java::io::FileNotFoundException;
# use java::io::IOException;
# use java::io::InputStream;
# use java::nio::channels::FileChannel;

1;

