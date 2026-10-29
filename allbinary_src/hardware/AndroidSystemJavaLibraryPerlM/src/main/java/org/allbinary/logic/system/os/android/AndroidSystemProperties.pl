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

package org::allbinary::logic::system::os::android::AndroidSystemProperties;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';

our $SINGLETON = 'org::allbinary::logic::system::os::android::AndroidSystemProperties'->new('org::allbinary::data::resource::ResourceUtil'->getInstance()->getContext());

sub _init_fields {
    my ($self) = @_;
    $self->{commonStrings} = 'org::allbinary::string::CommonStrings'->getInstance();
}


sub getInstance {
    my ($class) = @_;
        return $org::allbinary::logic::system::os::android::AndroidSystemProperties::SINGLETON;
}


sub new {
    my ($class, $context) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
    return $self;
}


sub getDeviceId {
    my ($self) = @_;
        return 'org::allbinary::logic::string::StringUtil'->getInstance()->{EMPTY_STRING};
}


sub getDeviceSoftwareVersion {
    my ($self) = @_;
        return $self->{commonStrings}->{DISABLE};
}


sub getLine1Number {
    my ($self) = @_;
        return $self->{commonStrings}->{DISABLE};
}


sub getNetworkCountryIso {
    my ($self) = @_;
        return $self->{commonStrings}->{DISABLE};
}


sub getNetworkOperator {
    my ($self) = @_;
        return $self->{commonStrings}->{DISABLE};
}


sub getNetworkOperatorName {
    my ($self) = @_;
        return $self->{commonStrings}->{DISABLE};
}


sub getSimCountryIso {
    my ($self) = @_;
        return $self->{commonStrings}->{DISABLE};
}


sub getSimOperator {
    my ($self) = @_;
        return $self->{commonStrings}->{DISABLE};
}


sub getSimOperatorName {
    my ($self) = @_;
        return $self->{commonStrings}->{DISABLE};
}


sub getSimSerialNumber {
    my ($self) = @_;
        return $self->{commonStrings}->{DISABLE};
}


sub getSubscriberId {
    my ($self) = @_;
        return $self->{commonStrings}->{DISABLE};
}


sub getVoiceMailAlphaTag {
    my ($self) = @_;
        return $self->{commonStrings}->{DISABLE};
}


sub getVoiceMailNumber {
    my ($self) = @_;
        return $self->{commonStrings}->{DISABLE};
}


sub getNetworkType {
    my ($self) = @_;
        return -1;
}


sub getPhoneType {
    my ($self) = @_;
        return -1;
}


sub getBoard {
    my ($self) = @_;
        return $android::os::Build::BOARD;
}


sub getBrand {
    my ($self) = @_;
        return $android::os::Build::BRAND;
}


sub getDevice {
    my ($self) = @_;
        return $android::os::Build::DEVICE;
}


sub getFingerprint {
    my ($self) = @_;
        return $android::os::Build::FINGERPRINT;
}


sub getHost {
    my ($self) = @_;
        return $android::os::Build::HOST;
}


sub getId {
    my ($self) = @_;
        return $android::os::Build::ID;
}


sub getModel {
    my ($self) = @_;
        return $android::os::Build::MODEL;
}


sub getProduct {
    my ($self) = @_;
        return $android::os::Build::PRODUCT;
}


sub getTags {
    my ($self) = @_;
        return $android::os::Build::TAGS;
}


sub getTime {
    my ($self) = @_;
        return $android::os::Build::TIME;
}


sub getType {
    my ($self) = @_;
        return $android::os::Build::TYPE;
}


sub getUser {
    my ($self) = @_;
        return $android::os::Build::USER;
}

use android::content::Context;
use android::os::Build;
use org::allbinary::data::resource::ResourceUtil;
use org::allbinary::logic::string::StringUtil;
use org::allbinary::string::CommonStrings;

1;

