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

package org::allbinary::logic::system::security::crypt::jcehelper::AbBasicCrypt;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::init::crypt::jcehelper::CryptInterface';


sub _init_fields {
    my ($self) = @_;
    $self->{cipher} = undef;
    $self->{secretKey} = undef;
    $self->{algorithm} = undef;
    $self->{key} = undef;
}


sub new {
    my ($class, $algorithm, $key) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
        try {
            $self->{algorithm} = $algorithm;
            $self->{key} = $key->getBytes();
            $self->init();
        } catch ($e) {
            my $commonStrings = 'org::allbinary::string::CommonStrings'->getInstance();
            'org::allbinary::logic::communication::log::PreLogUtil'->putOE($commonStrings->{EXCEPTION}, $self, "AbCrypt(alg,key)", $e);
        }
    return $self;
}


sub init {
    my ($self) = @_;
        try {
            my $sunJce = 'com::sun::crypto::provider::SunJCE'->new();
            'java::security::Security'->addProvider($sunJce);
            my $keySpec = 'org::allbinary::logic::system::security::crypt::jcehelper::KeySpecFactory'->getInstance()->getInstance($self->{algorithm}, $self->{key});
            my $keyFactory = 'javax::crypto::SecretKeyFactory'->getInstance($self->{algorithm});
            $self->{secretKey} = $keyFactory->generateSecret($keySpec);
            $self->{cipher} = 'javax::crypto::Cipher'->getInstance($self->{algorithm});
        } catch ($e) {
            my $commonStrings = 'org::allbinary::string::CommonStrings'->getInstance();
            'org::allbinary::logic::communication::log::PreLogUtil'->putOE("init Failed", $self, $commonStrings->{INIT}, $e);
        }
}


sub encrypt {
    my ($self, $array) = @_;
        try {
            $self->{cipher}->init($javax::crypto::Cipher::ENCRYPT_MODE, $self->{secretKey});
            my $ivArray = $self->{secretKey}->getEncoded();
            my $encrypted = $self->{cipher}->doFinal($array);
            my $result = [(0) x (scalar(@{$ivArray}) + scalar(@{$encrypted}))];
            'org::allbinary::logic::communication::log::PreLogUtil'->put("ivArray Length: " . scalar(@{$ivArray}), $self, "encrypt");
            for (my $index = 0; $index < scalar(@{$ivArray}); $index++) {
                $result->[$index] = $ivArray->[$index];
            }
            for (my $index = 0; $index < scalar(@{$encrypted}); $index++) {
                $result->[$index + scalar(@{$ivArray})] = $encrypted->[$index];
            }
            return $result;
        } catch ($e) {
            'org::allbinary::logic::communication::log::PreLogUtil'->putOE("Encrypt Failed", $self, "encrypt", $e);
            return undef;
        }
}


sub decrypt {
    my ($self, $array) = @_;
        try {
            $self->{cipher}->init($javax::crypto::Cipher::DECRYPT_MODE, $self->{secretKey});
            my $ivArray = [(0) x (8)];
            for (my $index = 0; $index < 8; $index++) {
                $ivArray->[$index] = $array->[$index];
            }
            'org::allbinary::logic::communication::log::PreLogUtil'->put("ivArray Length: " . scalar(@{$ivArray}), $self, "encrypt");
            my $result = [(0) x (scalar(@{$array}) - scalar(@{$ivArray}))];
            for (my $index = scalar(@{$ivArray}); $index < scalar(@{$array}); $index++) {
                $result->[$index - scalar(@{$ivArray})] = $array->[$index];
            }
            my $decrypted = $self->{cipher}->doFinal($result);
            return $result;
        } catch ($e) {
            'org::allbinary::logic::communication::log::PreLogUtil'->putOE("decrypt Failed", $self, "decrypt", $e);
            return undef;
        }
}

# use java::security::Provider;
# use java::security::Security;
# use java::security::spec::KeySpec;
# use javax::crypto::Cipher;
# use javax::crypto::SecretKey;
# use javax::crypto::SecretKeyFactory;
use org::allbinary::init::crypt::jcehelper::CryptInterface;
use org::allbinary::logic::communication::log::PreLogUtil;
use org::allbinary::string::CommonStrings;
use org::allbinary::logic::system::security::crypt::jcehelper::KeySpecFactory;

1;

