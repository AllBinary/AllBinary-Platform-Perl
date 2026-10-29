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

package org::allbinary::logic::system::security::crypt::jcehelper::SecretComposite;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::logic::system::security::crypt::jcehelper::BaseSecretComposite';


sub _init_fields {
    my ($self) = @_;
    $self->{byteUtil} = 'org::allbinary::logic::java::byteutil::ByteUtil'->getInstance();
    $self->{cipher} = undef;
    $self->{secretKey} = undef;
    $self->{key} = undef;
}


sub new {
    my ($class, $secretKey, $cipher, $key) = @_;
    my $self = $class->SUPER::new();
    $self->_init_fields();
        $self->{secretKey} = $secretKey;
        $self->{cipher} = $cipher;
        $self->{key} = $key;
    return $self;
}


# throws Exception
sub encrypt {
    my ($self, $array) = @_;
        $array = $self->mutilate($array);
        $self->{cipher}->init($javax::crypto::Cipher::ENCRYPT_MODE, $self->{secretKey});
        return $self->{cipher}->doFinal($array);
}


# throws Exception
sub decrypt {
    my ($self, $array) = @_;
        $self->{cipher}->init($javax::crypto::Cipher::DECRYPT_MODE, $self->{secretKey});
        return $self->mutilate($self->{cipher}->doFinal($array));
}


sub mutilate {
    my ($self, $array) = @_;
        for (my $index = 0; $index < scalar(@{$self->{key}}); $index++) {
            my $value = $self->{key}->[$index];
            if ($value < 8 && $value > 0) {
                $array = $self->{byteUtil}->xorByte($array, $value);
            }
        }
        return $array;
}

# use javax::crypto::Cipher;
# use javax::crypto::SecretKey;
use org::allbinary::logic::java::byteutil::ByteUtil;
use org::allbinary::logic::system::security::crypt::jcehelper::BaseSecretComposite;

1;

