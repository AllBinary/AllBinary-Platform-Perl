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

package org::allbinary::init::crypt::jcehelper::BasicCryptUtil;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';

our $instance = 'org::allbinary::init::crypt::jcehelper::BasicCryptUtil'->new();

sub _init_fields {
    my ($self) = @_;
    $self->{logUtil} = 'org::allbinary::logic::communication::log::LogUtil'->getInstance();
    $self->{tsUtil} = 'org::allbinary::TsUtil'->getInstance();
    $self->{XML_START} = "<?xml";
}

sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
    return $self;
}


sub getInstance {
    my ($class) = @_;
        return $org::allbinary::init::crypt::jcehelper::BasicCryptUtil::instance;
}


# throws Exception
sub getDecryptedInputStream {
    my ($self, $inputStream, $cryptInterface) = @_;
        my $buffer = 'java::io::ByteArrayOutputStream'->new();
        my $ch = 0;
        while (1) {
            $ch = $inputStream->read();
            if ($ch == -1) {
                last;
            }
            $buffer->write($ch);
        }
        my $decrypted = $cryptInterface->decrypt($buffer->toByteArray());
        my $decryptedString = pack("C*", @{$decrypted});
        my $index = index($decryptedString, $self->{XML_START});
        if ($index > 0) {
            $decryptedString = substr($decryptedString, $index);
        }
        return 'java::io::ByteArrayInputStream'->new($self->{tsUtil}->getByteArray($decryptedString));
}

# use java::io::ByteArrayInputStream;
# use java::io::ByteArrayOutputStream;
# use java::io::InputStream;
use org::allbinary::TsUtil;
use org::allbinary::logic::communication::log::LogUtil;

1;

