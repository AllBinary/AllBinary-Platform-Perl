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

package org::allbinary::logic::system::security::crypt::jcehelper::BasicCrypt;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::init::crypt::jcehelper::CryptInterface';


sub _init_fields {
    my ($self) = @_;
    $self->{byteUtil} = 'org::allbinary::logic::java::byteutil::ByteUtil'->getInstance();
    $self->{key} = undef;
}


sub new {
    my ($class, $keyAsString) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
        my $key = 'org::allbinary::logic::NullUtil'->getInstance()->{NULL_BYTE_ARRAY};
        try {
            $key = 'org::allbinary::TsUtil'->getInstance()->getByteArray($keyAsString);
        } catch ($e) {
            my $commonStrings = 'org::allbinary::string::CommonStrings'->getInstance();
            'org::allbinary::logic::communication::log::PreLogUtil'->putOE($commonStrings->{EXCEPTION}, $self, "AbCrypt(alg,key)", $e);
        }
        $self->{key} = $key;
    return $self;
}


sub encrypt {
    my ($self, $array) = @_;
        try {
            return $self->mutilate($array);
        } catch ($e) {
            'org::allbinary::logic::communication::log::PreLogUtil'->putOE("Encrypt Failed", $self, "encrypt", $e);
            return 'org::allbinary::logic::NullUtil'->getInstance()->{NULL_BYTE_ARRAY};
        }
}


sub decrypt {
    my ($self, $array) = @_;
        try {
            return $self->mutilate($array);
        } catch ($e) {
            'org::allbinary::logic::communication::log::PreLogUtil'->putOE("decrypt Failed", $self, "decrypt", $e);
            return 'org::allbinary::logic::NullUtil'->getInstance()->{NULL_BYTE_ARRAY};
        }
}


sub mutilate {
    my ($self, $array) = @_;
        my $value = 0;
        for (my $index = 0; $index < scalar(@{$self->{key}}); $index++) {
            $value = $self->{key}->[$index];
            $array = $self->{byteUtil}->xor($array, $value);
        }
        return $array;
}

use org::allbinary::TsUtil;
use org::allbinary::init::crypt::jcehelper::CryptInterface;
use org::allbinary::logic::NullUtil;
use org::allbinary::logic::communication::log::PreLogUtil;
use org::allbinary::logic::java::byteutil::ByteUtil;
use org::allbinary::string::CommonStrings;

1;

