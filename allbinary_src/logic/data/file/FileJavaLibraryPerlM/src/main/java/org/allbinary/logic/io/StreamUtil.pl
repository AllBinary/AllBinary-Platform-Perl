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

package org::allbinary::logic::io::StreamUtil;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';

our $instance = 'org::allbinary::logic::io::StreamUtil'->new();

sub _init_fields {
    my ($self) = @_;
    $self->{logUtil} = 'org::allbinary::logic::communication::log::LogUtil'->getInstance();
}


sub getInstance {
    my ($class) = @_;
        return $org::allbinary::logic::io::StreamUtil::instance;
}


sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
    return $self;
}


# throws Exception
sub get {
    my ($self, $inputStream, $outputStream, $buffer) = @_;
        my $len = 0;
        while (1) {
            $len = $inputStream->read($buffer, 0, scalar(@{$buffer}));
            if ($len != -1) {
            } else {
                last;
            }
            $outputStream->write($buffer, 0, $len);
        }
        return $outputStream;
}


# throws Exception
sub getByteArray {
    my ($self, $inputStream, $outputStream2, $byteArray) = @_;
        my $outputStream = $outputStream2;
        try {
            $self->get($inputStream, $outputStream, $byteArray);
            return $outputStream->toByteArray();
        } catch ($e) {
            die $e;
        } finally {
            $self->close($outputStream);
        }
}


sub close {
    my ($self, $closeable) = @_;
        try {
            if (defined($closeable)) {
                $closeable->close();
            }
            return 1;
        } catch ($e) {
            my $commonStrings = 'org::allbinary::string::CommonStrings'->getInstance();
            $self->{logUtil}->put($commonStrings->{EXCEPTION}, $self, $commonStrings->{CLOSE}, $e);
            return 0;
        }
}

# use java::io::ByteArrayOutputStream;
# use java::io::Closeable;
# use java::io::InputStream;
# use java::io::OutputStream;
use org::allbinary::logic::communication::log::LogUtil;
use org::allbinary::string::CommonStrings;

1;

