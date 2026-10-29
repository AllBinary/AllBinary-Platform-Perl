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

package org::allbinary::business::user::commerce::money::payment::Payment;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::business::user::commerce::money::payment::PaymentInterface','org::allbinary::data::tree::dom::DomNodeInterface';


sub _init_fields {
    my ($self) = @_;
    $self->{name} = undef;
    $self->{expiration} = undef;
    $self->{encryption} = undef;
    $self->{number} = undef;
    $self->{id} = undef;
    $self->{type} = undef;
    $self->{tenderType} = undef;
    $self->{transactionType} = undef;
    $self->{aba} = undef;
    $self->{account} = undef;
    $self->{accountType} = undef;
    $self->{authorizationCode} = undef;
    $self->{checkNumber} = undef;
    $self->{checkType} = undef;
    $self->{driversLicense} = undef;
    $self->{magneticInkCheckReader} = undef;
    $self->{isDefault} = 0;
}

sub new {
    my ($class, @arguments) = @_;
    return $class->_new1(@arguments) if scalar(@arguments) == 1;
    return $class->_new1(@arguments) if scalar(@arguments) == 1;
    return $class->_new0(@arguments) if scalar(@arguments) == 0;
    die "No constructor of Payment takes " . scalar(@arguments) . " arguments";
}


sub _new1 {
    my ($class, $payment) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
        $self->{name} = $payment->get($org::allbinary::business::user::commerce::money::payment::PaymentData::NAME);
        $self->{type} = $payment->get($org::allbinary::business::user::commerce::money::payment::PaymentData::TYPE);
        $self->{expiration} = $payment->get($org::allbinary::business::user::commerce::money::payment::PaymentData::EXPIRATION);
        $self->{encryption} = $payment->get('org::allbinary::business::entry::EntryData'->getInstance()->{ENCRYPTION});
        $self->{number} = 'org::allbinary::logic::control::crypt::SuperCrypt'->new(int($self->{encryption}))->decrypt($payment->get($org::allbinary::business::user::commerce::money::payment::PaymentData::NUMBER));
        $self->{id} = $payment->get($org::allbinary::business::user::commerce::money::payment::PaymentData::ID);
        my $def = $payment->get('org::allbinary::business::entry::EntryData'->getInstance()->{DEFAULT});
        if (defined($def) && ($def cmp 'org::allbinary::business::entry::EntryData'->getInstance()->{DEFAULT}) == 0) {
            $self->{isDefault} = 1;
        } else {
            $self->{isDefault} = 0;
        }
        $self->{tenderType} = $payment->get($org::allbinary::business::user::commerce::money::payment::PaymentData::TENDERTYPE);
        $self->{transactionType} = $payment->get($org::allbinary::business::user::commerce::money::payment::PaymentData::TRANSACTIONTYPE);
        $self->{aba} = $payment->get($org::allbinary::business::user::commerce::money::payment::PaymentData::ABA);
        $self->{account} = $payment->get($org::allbinary::business::user::commerce::money::payment::PaymentData::ACCOUNT);
        $self->{accountType} = $payment->get($org::allbinary::business::user::commerce::money::payment::PaymentData::ACCOUNTTYPE);
        $self->{authorizationCode} = $payment->get($org::allbinary::business::user::commerce::money::payment::PaymentData::AUTHORIZATIONCODE);
        $self->{checkNumber} = $payment->get($org::allbinary::business::user::commerce::money::payment::PaymentData::CHECKNUMBER);
        $self->{checkType} = $payment->get($org::allbinary::business::user::commerce::money::payment::PaymentData::CHECKTYPE);
        $self->{driversLicense} = $payment->get($org::allbinary::business::user::commerce::money::payment::PaymentData::DRIVERSLICENSE);
        $self->{magneticInkCheckReader} = $payment->get($org::allbinary::business::user::commerce::money::payment::PaymentData::MAGNETICINKCHECKREADER);
    return $self;
}


sub _new1 {
    my ($class, $request) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
        $self->{name} = $request->getParameter($org::allbinary::business::user::commerce::money::payment::PaymentData::NAME);
        $self->{type} = $request->getParameter($org::allbinary::business::user::commerce::money::payment::PaymentData::TYPE);
        $self->{expiration} = $request->getParameter($org::allbinary::business::user::commerce::money::payment::PaymentData::EXPIRATION);
        $self->{number} = $request->getParameter($org::allbinary::business::user::commerce::money::payment::PaymentData::NUMBER);
        $self->{tenderType} = $request->getParameter($org::allbinary::business::user::commerce::money::payment::PaymentData::TENDERTYPE);
        $self->{transactionType} = $request->getParameter($org::allbinary::business::user::commerce::money::payment::PaymentData::TRANSACTIONTYPE);
        $self->{aba} = $request->getParameter($org::allbinary::business::user::commerce::money::payment::PaymentData::ABA);
        $self->{account} = $request->getParameter($org::allbinary::business::user::commerce::money::payment::PaymentData::ACCOUNT);
        $self->{accountType} = $request->getParameter($org::allbinary::business::user::commerce::money::payment::PaymentData::ACCOUNTTYPE);
        $self->{authorizationCode} = $request->getParameter($org::allbinary::business::user::commerce::money::payment::PaymentData::AUTHORIZATIONCODE);
        $self->{checkNumber} = $request->getParameter($org::allbinary::business::user::commerce::money::payment::PaymentData::CHECKNUMBER);
        $self->{checkType} = $request->getParameter($org::allbinary::business::user::commerce::money::payment::PaymentData::CHECKTYPE);
        $self->{driversLicense} = $request->getParameter($org::allbinary::business::user::commerce::money::payment::PaymentData::DRIVERSLICENSE);
        $self->{magneticInkCheckReader} = $request->getParameter($org::allbinary::business::user::commerce::money::payment::PaymentData::MAGNETICINKCHECKREADER);
    return $self;
}


sub _new0 {
    my ($class) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
    return $self;
}


sub isValid {
    my ($self) = @_;
        my $stringUtil = 'org::allbinary::logic::string::StringUtil'->getInstance();
        my $aFalse = 0;
        if (!defined($self->{name}) || ($self->{name} cmp $stringUtil->{EMPTY_STRING}) == 0) {
            return $aFalse;
        }
        if (!defined($self->{type}) || ($self->{type} cmp $stringUtil->{EMPTY_STRING}) == 0) {
            return $aFalse;
        }
        if (!defined($self->{expiration}) || ($self->{expiration} cmp $stringUtil->{EMPTY_STRING}) == 0) {
            return $aFalse;
        }
        if (!defined($self->{number}) || ($self->{number} cmp $stringUtil->{EMPTY_STRING}) == 0) {
            return $aFalse;
        }
        if (length($self->{number}) > $org::allbinary::business::user::commerce::money::payment::org::allbinary->{business}->{user}->{commerce}->{money}->{payment}->{types}->{CreditCardType}->{MAXLEN}) {
            return $aFalse;
        }
        return 1;
}


sub setTenderType {
    my ($self, $value) = @_;
        $self->{tenderType} = $value;
}


sub setTransactionType {
    my ($self, $value) = @_;
        $self->{transactionType} = $value;
}


sub setAuthorizationCode {
    my ($self, $value) = @_;
        $self->{authorizationCode} = $value;
}


sub setCheckType {
    my ($self, $value) = @_;
        $self->{checkType} = $value;
}


sub setCheckNumber {
    my ($self, $value) = @_;
        $self->{checkNumber} = $value;
}


sub setDriversLicense {
    my ($self, $value) = @_;
        $self->{driversLicense} = $value;
}


sub setMagneticInkCheckReader {
    my ($self, $value) = @_;
        $self->{magneticInkCheckReader} = $value;
}


sub setAba {
    my ($self, $value) = @_;
        $self->{aba} = $value;
}


sub setAccountType {
    my ($self, $value) = @_;
        $self->{accountType} = $value;
}


sub setName {
    my ($self, $value) = @_;
        $self->{name} = $value;
}


sub setType {
    my ($self, $value) = @_;
        $self->{type} = $value;
}


sub setExpiration {
    my ($self, $value) = @_;
        $self->{expiration} = $value;
}


sub setNumber {
    my ($self, $value) = @_;
        $self->{number} = $value;
}


sub getId {
    my ($self) = @_;
        return $self->{id};
}


sub getName {
    my ($self) = @_;
        return $self->{name};
}


sub getType {
    my ($self) = @_;
        return $self->{type};
}


sub getExpiration {
    my ($self) = @_;
        return $self->{expiration};
}


sub getEncryption {
    my ($self) = @_;
        return $self->{encryption};
}


sub getNumber {
    my ($self) = @_;
        return $self->{number};
}


sub getTenderType {
    my ($self) = @_;
        return $self->{tenderType};
}


sub getTransactionType {
    my ($self) = @_;
        return $self->{transactionType};
}


sub getAba {
    my ($self) = @_;
        return $self->{aba};
}


sub getAccount {
    my ($self) = @_;
        return $self->{account};
}


sub getAccountType {
    my ($self) = @_;
        return $self->{accountType};
}


sub getAuthorizationCode {
    my ($self) = @_;
        return $self->{authorizationCode};
}


sub getCheckNumber {
    my ($self) = @_;
        return $self->{checkNumber};
}


sub getCheckType {
    my ($self) = @_;
        return $self->{checkType};
}


sub getDriversLicense {
    my ($self) = @_;
        return $self->{driversLicense};
}


sub getMagneticInkCheckReader {
    my ($self) = @_;
        return $self->{magneticInkCheckReader};
}


sub getLastFour {
    my ($self) = @_;
        if (length($self->{number}) > $org::allbinary::business::user::commerce::money::payment::PaymentData::MIN && length($self->{number}) <= $org::allbinary::business::user::commerce::money::payment::PaymentData::MAX) {
            return substr($self->{number}, length($self->{number}) - 4);
        } else {
            return "Invalid #";
        }
}


sub isDefault {
    my ($self) = @_;
        return $self->{isDefault};
}


sub toHashMap {
    my ($self) = @_;
        my $hashMap = 'org::allbinary::logic::StdUtil'->getInstance()->createHashMap();
        $hashMap->put($org::allbinary::business::user::commerce::money::payment::PaymentData::NAME, $self->{name});
        $hashMap->put($org::allbinary::business::user::commerce::money::payment::PaymentData::TYPE, $self->{type});
        $hashMap->put($org::allbinary::business::user::commerce::money::payment::PaymentData::EXPIRATION, $self->{expiration});
        $hashMap->put($org::allbinary::business::user::commerce::money::payment::PaymentData::NUMBER, $self->getLastFour());
        $hashMap->put($org::allbinary::business::user::commerce::money::payment::PaymentData::TENDERTYPE, $self->{tenderType});
        $hashMap->put($org::allbinary::business::user::commerce::money::payment::PaymentData::TRANSACTIONTYPE, $self->{transactionType});
        $hashMap->put($org::allbinary::business::user::commerce::money::payment::PaymentData::ABA, $self->{aba});
        $hashMap->put($org::allbinary::business::user::commerce::money::payment::PaymentData::ACCOUNT, $self->{account});
        $hashMap->put($org::allbinary::business::user::commerce::money::payment::PaymentData::ACCOUNTTYPE, $self->{accountType});
        $hashMap->put($org::allbinary::business::user::commerce::money::payment::PaymentData::AUTHORIZATIONCODE, $self->{authorizationCode});
        $hashMap->put($org::allbinary::business::user::commerce::money::payment::PaymentData::CHECKNUMBER, $self->{checkNumber});
        $hashMap->put($org::allbinary::business::user::commerce::money::payment::PaymentData::DRIVERSLICENSE, $self->{driversLicense});
        $hashMap->put($org::allbinary::business::user::commerce::money::payment::PaymentData::MAGNETICINKCHECKREADER, $self->{magneticInkCheckReader});
        if ($self->{isDefault}) {
            $hashMap->put('org::allbinary::business::entry::EntryData'->getInstance()->{DEFAULT}, 'org::allbinary::business::entry::EntryData'->getInstance()->{DEFAULT});
        } else {
            $hashMap->put('org::allbinary::business::entry::EntryData'->getInstance()->{DEFAULT}, 'org::allbinary::logic::string::StringUtil'->getInstance()->{EMPTY_STRING});
        }
        return $hashMap;
}


# throws Exception
sub toXmlNode {
    my ($self, $document) = @_;
        my $hashMap = $self->toHashMap();
        my $node = 'org::allbinary::data::tree::dom::ModDomHelper'->createNameValueNodes($document, $org::allbinary::business::user::commerce::money::payment::PaymentData::PAYMENT, $hashMap);
        return $node;
}


sub toXmlDoc {
    my ($self) = @_;
        return undef;
}


sub view {
    my ($self) = @_;
        return undef;
}


sub toValidationInfoDoc {
    my ($self) = @_;
        return undef;
}


sub toValidationInfoNode {
    my ($self, $document) = @_;
        return undef;
}


sub validationInfo {
    my ($self) = @_;
        return undef;
}

use java::util::HashMap;
# use javax::servlet::ServletRequest;
use org::allbinary::business::entry::EntryData;
use org::allbinary::data::tree::dom::DomNodeInterface;
use org::allbinary::data::tree::dom::ModDomHelper;
use org::allbinary::logic::StdUtil;
use org::allbinary::logic::control::crypt::SuperCrypt;
use org::allbinary::logic::string::StringUtil;
use org::w3c::dom::Document;
use org::w3c::dom::Node;
use org::allbinary::business::user::commerce::money::payment::PaymentInterface;
use org::allbinary::business::user::commerce::money::payment::PaymentData;

1;

