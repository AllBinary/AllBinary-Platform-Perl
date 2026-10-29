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

package org::allbinary::logic::system::security::AbCryptUtil;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';

our $instance = 'org::allbinary::logic::system::security::AbCryptUtil'->new();

sub _init_fields {
    my ($self) = @_;
    $self->{streamUtil} = 'org::allbinary::logic::io::StreamUtil'->getInstance();
}


sub getInstance {
    my ($class) = @_;
        return $org::allbinary::logic::system::security::AbCryptUtil::instance;
}


sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
    return $self;
}


# throws Exception
sub decrypt {
    my ($self, $inputStream, $key) = @_;
        my $outputStream = undef;
        try {
            $outputStream = $self->{streamUtil}->get($inputStream, 'java::io::ByteArrayOutputStream'->new(), [(0) x (16384)]);
            my $abCrypt = 'org::allbinary::logic::system::security::crypt::jcehelper::AbCrypt'->new('org::allbinary::logic::system::security::crypt::jcehelper::KeySpecFactory'->getInstance()->{DESEDE});
            $abCrypt->init($key);
            return $abCrypt->decrypt($outputStream->toByteArray());
        } catch ($exception) { die $exception; } finally {
            $self->{streamUtil}->close($outputStream);
            $self->{streamUtil}->close($inputStream);
        }
}

# use java::io::ByteArrayOutputStream;
# use java::io::InputStream;
use org::allbinary::logic::io::StreamUtil;
use org::allbinary::logic::system::security::crypt::jcehelper::AbCrypt;
use org::allbinary::logic::system::security::crypt::jcehelper::KeySpecFactory;

1;

