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

package org::allbinary::logic::system::security::crypt::jcehelper::AbCrypt;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::init::crypt::jcehelper::CryptInterface';


sub _init_fields {
    my ($self) = @_;
    $self->{tsUtil} = 'org::allbinary::TsUtil'->getInstance();
    $self->{secretComposite} = $org::allbinary::logic::system::security::crypt::jcehelper::BaseSecretComposite::NULL_SECRET_COMPOSITE;
    $self->{algorithm} = undef;
}


sub new {
    my ($class, $algorithm) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
        $self->{algorithm} = $algorithm;
    return $self;
}


sub init {
    my ($self, $keyAsString) = @_;
        my $commonStrings = 'org::allbinary::string::CommonStrings'->getInstance();
        try {
            try {
                'java::security::Security'->addProvider('org::bouncycastle::jce::provider::BouncyCastleProvider'->new());
            } catch ($e) {
                'org::allbinary::logic::communication::log::PreLogUtil'->putOE($commonStrings->{EXCEPTION}, $self, $commonStrings->{INIT}, $e);
            }
            my $key = $self->{tsUtil}->getByteArray($keyAsString);
            my $keySpec = 'org::allbinary::logic::system::security::crypt::jcehelper::KeySpecFactory'->getInstance()->getInstance($self->{algorithm}, $key);
            my $keyFactory = 'javax::crypto::SecretKeyFactory'->getInstance($self->{algorithm});
            my $secretKey = $keyFactory->generateSecret($keySpec);
            my $cipher = 'javax::crypto::Cipher'->getInstance($self->{algorithm});
            $self->{secretComposite} = 'org::allbinary::logic::system::security::crypt::jcehelper::SecretComposite'->new($secretKey, $cipher, $key);
        } catch ($e) {
            'org::allbinary::logic::communication::log::PreLogUtil'->putOE("init Failed", $self, $commonStrings->{INIT}, $e);
        }
}


sub encrypt {
    my ($self, $array) = @_;
        try {
            return $self->{secretComposite}->encrypt($array);
        } catch ($e) {
            'org::allbinary::logic::communication::log::PreLogUtil'->putOE("Encrypt Failed", $self, "encrypt", $e);
            return 'org::allbinary::logic::NullUtil'->getInstance()->{NULL_BYTE_ARRAY};
        }
}


sub decrypt {
    my ($self, $array) = @_;
        try {
            return $self->{secretComposite}->decrypt($array);
        } catch ($e) {
            'org::allbinary::logic::communication::log::PreLogUtil'->putOE("decrypt Failed", $self, "decrypt", $e);
            return 'org::allbinary::logic::NullUtil'->getInstance()->{NULL_BYTE_ARRAY};
        }
}

# use java::security::Security;
# use java::security::spec::KeySpec;
# use javax::crypto::Cipher;
# use javax::crypto::SecretKey;
# use javax::crypto::SecretKeyFactory;
use org::allbinary::TsUtil;
use org::allbinary::init::crypt::jcehelper::CryptInterface;
use org::allbinary::logic::NullUtil;
use org::allbinary::logic::communication::log::PreLogUtil;
use org::allbinary::string::CommonStrings;
use org::bouncycastle::jce::provider::BouncyCastleProvider;
use org::allbinary::logic::system::security::crypt::jcehelper::BaseSecretComposite;
use org::allbinary::logic::system::security::crypt::jcehelper::KeySpecFactory;
use org::allbinary::logic::system::security::crypt::jcehelper::SecretComposite;

1;

