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

package org::allbinary::business::user::commerce::money::payment::gateway::PaymentGateway;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::business::user::commerce::money::payment::gateway::PaymentGatewayInterface';


sub _init_fields {
    my ($self) = @_;
    $self->{storeName} = undef;
    $self->{name} = undef;
    $self->{enable} = undef;
    $self->{paymentMethod} = undef;
    $self->{mode} = undef;
    $self->{testProtocol} = undef;
    $self->{testServer} = undef;
    $self->{testPort} = undef;
    $self->{testPath} = undef;
    $self->{serverProtocol} = undef;
    $self->{server} = undef;
    $self->{serverPort} = undef;
    $self->{serverPath} = undef;
    $self->{timeout} = undef;
    $self->{userName} = undef;
    $self->{password} = undef;
    $self->{proxyProtocol} = undef;
    $self->{proxyServer} = undef;
    $self->{proxyPort} = undef;
    $self->{proxyPath} = undef;
    $self->{proxyUserName} = undef;
    $self->{proxyPassword} = undef;
    $self->{proxyTimeout} = undef;
    $self->{special1} = undef;
    $self->{special2} = undef;
    $self->{special3} = undef;
    $self->{special4} = undef;
    $self->{special5} = undef;
    $self->{special6} = undef;
    $self->{special7} = undef;
    $self->{special8} = undef;
    $self->{special9} = undef;
    $self->{lastModified} = undef;
    $self->{timeEntered} = undef;
}


sub new {
    my ($class, $hashMap) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
        $self->getFormData($hashMap);
    return $self;
}


sub getFormData {
    my ($self, $hashMap) = @_;
        my $stringUtil = 'org::allbinary::logic::string::StringUtil'->getInstance();
        my $empty = $stringUtil->{EMPTY_STRING};
        $self->{storeName} = $hashMap->get('org::allbinary::business::context::modules::storefront::StoreFrontData'->getInstance()->{NAME}->toString());
        $self->{name} = $hashMap->get($org::allbinary::business::user::commerce::money::payment::gateway::PaymentGatewayData::NAME->toString());
        $self->{enable} = $stringUtil->getNonNull($hashMap->get('org::allbinary::business::entry::EntryData'->getInstance()->{ENABLE}->toString()));
        $self->{paymentMethod} = $stringUtil->getNonNull($hashMap->get($org::allbinary::business::user::commerce::money::payment::PaymentData::METHOD->toString()));
        $self->{mode} = $stringUtil->getNonNull($hashMap->get($org::allbinary::business::user::commerce::money::payment::gateway::PaymentGatewayData::MODE->toString()));
        $self->{testProtocol} = $stringUtil->getNonNull($hashMap->get($org::allbinary::business::user::commerce::money::payment::gateway::PaymentGatewayData::TESTPROTOCOL->toString()));
        $self->{testServer} = $stringUtil->getNonNull($hashMap->get($org::allbinary::business::user::commerce::money::payment::gateway::PaymentGatewayData::TESTSERVER->toString()));
        $self->{testPort} = $stringUtil->getNonNull($hashMap->get($org::allbinary::business::user::commerce::money::payment::gateway::PaymentGatewayData::TESTPORT->toString()));
        $self->{testPath} = $hashMap->get($org::allbinary::business::user::commerce::money::payment::gateway::PaymentGatewayData::TESTPATH->toString());
        if (!defined($self->{testPath})) {
            $self->{testPath} = $empty;
        }
        $self->{serverProtocol} = $hashMap->get($org::allbinary::business::user::commerce::money::payment::gateway::PaymentGatewayData::SERVERPROTOCOL->toString());
        if (!defined($self->{serverProtocol})) {
            $self->{serverProtocol} = $empty;
        }
        $self->{server} = $hashMap->get($org::allbinary::business::user::commerce::money::payment::gateway::PaymentGatewayData::SERVER->toString());
        if (!defined($self->{server})) {
            $self->{server} = $empty;
        }
        $self->{serverPort} = $hashMap->get($org::allbinary::business::user::commerce::money::payment::gateway::PaymentGatewayData::SERVERPORT->toString());
        if (!defined($self->{serverPort})) {
            $self->{serverPort} = $empty;
        }
        $self->{serverPath} = $hashMap->get($org::allbinary::business::user::commerce::money::payment::gateway::PaymentGatewayData::SERVERPATH->toString());
        if (!defined($self->{serverPath})) {
            $self->{serverPath} = $empty;
        }
        $self->{userName} = $hashMap->get($org::allbinary::business::user::UserData::USERNAME->toString());
        if (!defined($self->{userName})) {
            $self->{userName} = $empty;
        }
        $self->{password} = $hashMap->get($org::allbinary::business::user::UserData::PASSWORD->toString());
        if (!defined($self->{password})) {
            $self->{password} = $empty;
        }
        $self->{timeout} = $hashMap->get($org::allbinary::business::user::commerce::money::payment::gateway::PaymentGatewayData::TIMEOUT->toString());
        if (!defined($self->{timeout})) {
            $self->{timeout} = $empty;
        }
        $self->{proxyProtocol} = $hashMap->get($org::allbinary::business::user::commerce::money::payment::gateway::PaymentGatewayData::PROXYPROTOCOL->toString());
        if (!defined($self->{proxyProtocol})) {
            $self->{proxyProtocol} = $empty;
        }
        $self->{proxyServer} = $hashMap->get($org::allbinary::business::user::commerce::money::payment::gateway::PaymentGatewayData::PROXYSERVER->toString());
        if (!defined($self->{proxyServer})) {
            $self->{proxyServer} = $empty;
        }
        $self->{proxyPort} = $hashMap->get($org::allbinary::business::user::commerce::money::payment::gateway::PaymentGatewayData::PROXYPORT->toString());
        if (!defined($self->{proxyPort})) {
            $self->{proxyPort} = $empty;
        }
        $self->{proxyPath} = $hashMap->get($org::allbinary::business::user::commerce::money::payment::gateway::PaymentGatewayData::PROXYPATH->toString());
        if (!defined($self->{proxyPath})) {
            $self->{proxyPath} = $empty;
        }
        $self->{proxyUserName} = $hashMap->get($org::allbinary::business::user::commerce::money::payment::gateway::PaymentGatewayData::PROXYUSERNAME->toString());
        if (!defined($self->{proxyUserName})) {
            $self->{proxyUserName} = $empty;
        }
        $self->{proxyPassword} = $hashMap->get($org::allbinary::business::user::commerce::money::payment::gateway::PaymentGatewayData::PROXYPASSWORD->toString());
        if (!defined($self->{proxyPassword})) {
            $self->{proxyPassword} = $empty;
        }
        $self->{proxyTimeout} = $hashMap->get($org::allbinary::business::user::commerce::money::payment::gateway::PaymentGatewayData::PROXYTIMEOUT->toString());
        if (!defined($self->{proxyTimeout})) {
            $self->{proxyTimeout} = $empty;
        }
        $self->{special1} = $hashMap->get($org::allbinary::business::user::commerce::money::payment::gateway::PaymentGatewayData::SPECIAL1->toString());
        if (!defined($self->{special1})) {
            $self->{special1} = $empty;
        }
        $self->{special2} = $hashMap->get($org::allbinary::business::user::commerce::money::payment::gateway::PaymentGatewayData::SPECIAL2->toString());
        if (!defined($self->{special2})) {
            $self->{special2} = $empty;
        }
        $self->{special3} = $hashMap->get($org::allbinary::business::user::commerce::money::payment::gateway::PaymentGatewayData::SPECIAL3->toString());
        if (!defined($self->{special3})) {
            $self->{special3} = $empty;
        }
        $self->{special4} = $hashMap->get($org::allbinary::business::user::commerce::money::payment::gateway::PaymentGatewayData::SPECIAL4->toString());
        if (!defined($self->{special4})) {
            $self->{special4} = $empty;
        }
        $self->{special5} = $hashMap->get($org::allbinary::business::user::commerce::money::payment::gateway::PaymentGatewayData::SPECIAL5->toString());
        if (!defined($self->{special5})) {
            $self->{special5} = $empty;
        }
        $self->{special6} = $hashMap->get($org::allbinary::business::user::commerce::money::payment::gateway::PaymentGatewayData::SPECIAL6->toString());
        if (!defined($self->{special6})) {
            $self->{special6} = $empty;
        }
        $self->{special7} = $hashMap->get($org::allbinary::business::user::commerce::money::payment::gateway::PaymentGatewayData::SPECIAL7->toString());
        if (!defined($self->{special7})) {
            $self->{special7} = $empty;
        }
        $self->{special8} = $hashMap->get($org::allbinary::business::user::commerce::money::payment::gateway::PaymentGatewayData::SPECIAL8->toString());
        if (!defined($self->{special8})) {
            $self->{special8} = $empty;
        }
        $self->{special9} = $hashMap->get($org::allbinary::business::user::commerce::money::payment::gateway::PaymentGatewayData::SPECIAL9->toString());
        if (!defined($self->{special9})) {
            $self->{special9} = $empty;
        }
        $self->{lastModified} = $hashMap->get('org::allbinary::business::entry::EntryData'->getInstance()->{LASTMODIFIED}->toString());
        if (!defined($self->{lastModified})) {
            $self->{lastModified} = $empty;
        }
        $self->{timeEntered} = $hashMap->get('org::allbinary::business::entry::EntryData'->getInstance()->{TIMECREATED}->toString());
        if (!defined($self->{timeEntered})) {
            $self->{timeEntered} = $empty;
        }
}


sub getStoreName {
    my ($self) = @_;
        return $self->{storeName};
}


sub getName {
    my ($self) = @_;
        return $self->{name};
}


sub getEnable {
    my ($self) = @_;
        return $self->{enable};
}


sub getPaymentMethod {
    my ($self) = @_;
        return $self->{paymentMethod};
}


sub getMode {
    my ($self) = @_;
        return $self->{mode};
}


sub getTestProtocol {
    my ($self) = @_;
        return $self->{testProtocol};
}


sub getTestServer {
    my ($self) = @_;
        return $self->{testServer};
}


sub getTestPort {
    my ($self) = @_;
        return $self->{testPort};
}


sub getTestPath {
    my ($self) = @_;
        return $self->{testPath};
}


sub getServerProtocol {
    my ($self) = @_;
        return $self->{serverProtocol};
}


sub getServer {
    my ($self) = @_;
        return $self->{server};
}


sub getServerPort {
    my ($self) = @_;
        return $self->{serverPort};
}


sub getServerPath {
    my ($self) = @_;
        return $self->{serverPath};
}


sub getUserName {
    my ($self) = @_;
        return $self->{userName};
}


sub getPassword {
    my ($self) = @_;
        return $self->{password};
}


sub getProxyProtocol {
    my ($self) = @_;
        return $self->{proxyProtocol};
}


sub getProxyServer {
    my ($self) = @_;
        return $self->{proxyServer};
}


sub getProxyPath {
    my ($self) = @_;
        return $self->{proxyPath};
}


sub getProxyPort {
    my ($self) = @_;
        return $self->{proxyPort};
}


sub getProxyUserName {
    my ($self) = @_;
        return $self->{proxyUserName};
}


sub getProxyPassword {
    my ($self) = @_;
        return $self->{proxyPassword};
}


sub getTimeout {
    my ($self) = @_;
        return $self->{timeout};
}


sub getProxyTimeout {
    my ($self) = @_;
        return $self->{proxyTimeout};
}


sub getSpecial1 {
    my ($self) = @_;
        return $self->{special1};
}


sub getSpecial2 {
    my ($self) = @_;
        return $self->{special2};
}


sub getSpecial3 {
    my ($self) = @_;
        return $self->{special3};
}


sub getSpecial4 {
    my ($self) = @_;
        return $self->{special4};
}


sub getSpecial5 {
    my ($self) = @_;
        return $self->{special5};
}


sub getSpecial6 {
    my ($self) = @_;
        return $self->{special6};
}


sub getSpecial7 {
    my ($self) = @_;
        return $self->{special7};
}


sub getSpecial8 {
    my ($self) = @_;
        return $self->{special8};
}


sub getSpecial9 {
    my ($self) = @_;
        return $self->{special9};
}


sub getLastModified {
    my ($self) = @_;
        return $self->{lastModified};
}


sub getTimeEntered {
    my ($self) = @_;
        return $self->{timeEntered};
}


sub setEnable {
    my ($self, $value) = @_;
        $self->{enable} = $value;
}


sub setStoreName {
    my ($self, $value) = @_;
        $self->{storeName} = $value;
}


sub setName {
    my ($self, $value) = @_;
        $self->{name} = $value;
}


sub setPaymentMethod {
    my ($self, $value) = @_;
        $self->{paymentMethod} = $value;
}


sub setMode {
    my ($self, $value) = @_;
        $self->{mode} = $value;
}


sub setTestProtocol {
    my ($self, $value) = @_;
        $self->{testProtocol} = $value;
}


sub setTestServer {
    my ($self, $value) = @_;
        $self->{testServer} = $value;
}


sub setTestPort {
    my ($self, $value) = @_;
        $self->{testPort} = $value;
}


sub setTestPath {
    my ($self, $value) = @_;
        $self->{testPath} = $value;
}


sub setServerProtocol {
    my ($self, $value) = @_;
        $self->{serverProtocol} = $value;
}


sub setServer {
    my ($self, $value) = @_;
        $self->{server} = $value;
}


sub setServerPort {
    my ($self, $value) = @_;
        $self->{serverPort} = $value;
}


sub setServerPath {
    my ($self, $value) = @_;
        $self->{serverPath} = $value;
}


sub setTimeout {
    my ($self, $value) = @_;
        $self->{timeout} = $value;
}


sub setUserName {
    my ($self, $value) = @_;
        $self->{userName} = $value;
}


sub setPassword {
    my ($self, $value) = @_;
        $self->{password} = $value;
}


sub setProxyProtocol {
    my ($self, $value) = @_;
        $self->{proxyProtocol} = $value;
}


sub setProxyServer {
    my ($self, $value) = @_;
        $self->{proxyServer} = $value;
}


sub setProxyPort {
    my ($self, $value) = @_;
        $self->{proxyPort} = $value;
}


sub setProxyPath {
    my ($self, $value) = @_;
        $self->{proxyPath} = $value;
}


sub setProxyUserName {
    my ($self, $value) = @_;
        $self->{proxyUserName} = $value;
}


sub setProxyPassword {
    my ($self, $value) = @_;
        $self->{proxyPassword} = $value;
}


sub setProxyTimeout {
    my ($self, $value) = @_;
        $self->{proxyTimeout} = $value;
}


sub setSpecial1 {
    my ($self, $value) = @_;
        $self->{special1} = $value;
}


sub setSpecial2 {
    my ($self, $value) = @_;
        $self->{special2} = $value;
}


sub setSpecial3 {
    my ($self, $value) = @_;
        $self->{special3} = $value;
}


sub setSpecial4 {
    my ($self, $value) = @_;
        $self->{special4} = $value;
}


sub setSpecial5 {
    my ($self, $value) = @_;
        $self->{special5} = $value;
}


sub setSpecial6 {
    my ($self, $value) = @_;
        $self->{special6} = $value;
}


sub setSpecial7 {
    my ($self, $value) = @_;
        $self->{special7} = $value;
}


sub setSpecial8 {
    my ($self, $value) = @_;
        $self->{special8} = $value;
}


sub setSpecial9 {
    my ($self, $value) = @_;
        $self->{special9} = $value;
}


sub setLastModified {
    my ($self, $value) = @_;
        $self->{lastModified} = $value;
}


sub setTimeEntered {
    my ($self, $value) = @_;
        $self->{timeEntered} = $value;
}


# throws Exception
sub toHashMap {
    my ($self) = @_;
        return $self->toHashMap(1);
}


# throws Exception
# Java overloaded method: Perl keeps the last definition
sub toHashMap {
    my ($self, $isEncrypted) = @_;
        my $paymentGatewayHashMap = 'org::allbinary::logic::StdUtil'->getInstance()->createHashMap();
        $paymentGatewayHashMap->put('org::allbinary::business::entry::EntryData'->getInstance()->{ENABLE}, $self->{enable});
        $paymentGatewayHashMap->put('org::allbinary::business::context::modules::storefront::StoreFrontData'->getInstance()->{NAME}->toString(), $self->{storeName});
        $paymentGatewayHashMap->put($org::allbinary::business::user::commerce::money::payment::gateway::PaymentGatewayData::NAME->toString(), $self->getName());
        $paymentGatewayHashMap->put($org::allbinary::business::user::commerce::money::payment::PaymentData::METHOD->toString(), $self->{paymentMethod});
        $paymentGatewayHashMap->put($org::allbinary::business::user::commerce::money::payment::gateway::PaymentGatewayData::MODE->toString(), $self->{mode});
        $paymentGatewayHashMap->put($org::allbinary::business::user::commerce::money::payment::gateway::PaymentGatewayData::TESTPROTOCOL->toString(), $self->{testProtocol});
        $paymentGatewayHashMap->put($org::allbinary::business::user::commerce::money::payment::gateway::PaymentGatewayData::TESTSERVER->toString(), $self->{testServer});
        $paymentGatewayHashMap->put($org::allbinary::business::user::commerce::money::payment::gateway::PaymentGatewayData::TESTPORT->toString(), $self->{testPort});
        $paymentGatewayHashMap->put($org::allbinary::business::user::commerce::money::payment::gateway::PaymentGatewayData::TESTPATH->toString(), $self->{testPath});
        $paymentGatewayHashMap->put($org::allbinary::business::user::commerce::money::payment::gateway::PaymentGatewayData::SERVERPROTOCOL->toString(), $self->{serverProtocol});
        $paymentGatewayHashMap->put($org::allbinary::business::user::commerce::money::payment::gateway::PaymentGatewayData::SERVER->toString(), $self->{server});
        $paymentGatewayHashMap->put($org::allbinary::business::user::commerce::money::payment::gateway::PaymentGatewayData::SERVERPORT->toString(), $self->{serverPort});
        $paymentGatewayHashMap->put($org::allbinary::business::user::commerce::money::payment::gateway::PaymentGatewayData::SERVERPATH->toString(), $self->{serverPath});
        if ($isEncrypted) {
            my $superCrypt = 'org::allbinary::logic::control::crypt::SuperCrypt'->new($org::allbinary::business::user::commerce::money::payment::gateway::PaymentGatewayData::CRYPTNUM);
            $paymentGatewayHashMap->put($org::allbinary::business::user::UserData::USERNAME->toString(), $superCrypt->encrypt($self->{userName}));
            $paymentGatewayHashMap->put($org::allbinary::business::user::UserData::PASSWORD->toString(), $superCrypt->encrypt($self->{password}));
        } else {
            $paymentGatewayHashMap->put($org::allbinary::business::user::UserData::USERNAME->toString(), $self->{userName});
            $paymentGatewayHashMap->put($org::allbinary::business::user::UserData::PASSWORD->toString(), $self->{password});
        }
        $paymentGatewayHashMap->put($org::allbinary::business::user::commerce::money::payment::gateway::PaymentGatewayData::TIMEOUT->toString(), $self->{timeout});
        $paymentGatewayHashMap->put($org::allbinary::business::user::commerce::money::payment::gateway::PaymentGatewayData::PROXYPROTOCOL->toString(), $self->{proxyProtocol});
        $paymentGatewayHashMap->put($org::allbinary::business::user::commerce::money::payment::gateway::PaymentGatewayData::PROXYSERVER->toString(), $self->{proxyServer});
        $paymentGatewayHashMap->put($org::allbinary::business::user::commerce::money::payment::gateway::PaymentGatewayData::PROXYPORT->toString(), $self->{proxyPort});
        $paymentGatewayHashMap->put($org::allbinary::business::user::commerce::money::payment::gateway::PaymentGatewayData::PROXYPATH->toString(), $self->{proxyPath});
        $paymentGatewayHashMap->put($org::allbinary::business::user::commerce::money::payment::gateway::PaymentGatewayData::PROXYUSERNAME->toString(), $self->{proxyUserName});
        $paymentGatewayHashMap->put($org::allbinary::business::user::commerce::money::payment::gateway::PaymentGatewayData::PROXYPASSWORD->toString(), $self->{proxyPassword});
        $paymentGatewayHashMap->put($org::allbinary::business::user::commerce::money::payment::gateway::PaymentGatewayData::PROXYTIMEOUT->toString(), $self->{proxyTimeout});
        if ($isEncrypted) {
            my $superCrypt = 'org::allbinary::logic::control::crypt::SuperCrypt'->new($org::allbinary::business::user::commerce::money::payment::gateway::PaymentGatewayData::CRYPTNUM);
            $paymentGatewayHashMap->put($org::allbinary::business::user::commerce::money::payment::gateway::PaymentGatewayData::SPECIAL1->toString(), $superCrypt->encrypt($self->{special1}));
            $paymentGatewayHashMap->put($org::allbinary::business::user::commerce::money::payment::gateway::PaymentGatewayData::SPECIAL2->toString(), $superCrypt->encrypt($self->{special2}));
            $paymentGatewayHashMap->put($org::allbinary::business::user::commerce::money::payment::gateway::PaymentGatewayData::SPECIAL3->toString(), $superCrypt->encrypt($self->{special3}));
            $paymentGatewayHashMap->put($org::allbinary::business::user::commerce::money::payment::gateway::PaymentGatewayData::SPECIAL4->toString(), $superCrypt->encrypt($self->{special4}));
            $paymentGatewayHashMap->put($org::allbinary::business::user::commerce::money::payment::gateway::PaymentGatewayData::SPECIAL5->toString(), $superCrypt->encrypt($self->{special5}));
            $paymentGatewayHashMap->put($org::allbinary::business::user::commerce::money::payment::gateway::PaymentGatewayData::SPECIAL6->toString(), $superCrypt->encrypt($self->{special6}));
            $paymentGatewayHashMap->put($org::allbinary::business::user::commerce::money::payment::gateway::PaymentGatewayData::SPECIAL7->toString(), $superCrypt->encrypt($self->{special7}));
            $paymentGatewayHashMap->put($org::allbinary::business::user::commerce::money::payment::gateway::PaymentGatewayData::SPECIAL8->toString(), $superCrypt->encrypt($self->{special8}));
        } else {
            $paymentGatewayHashMap->put($org::allbinary::business::user::commerce::money::payment::gateway::PaymentGatewayData::SPECIAL1->toString(), $self->{special1});
            $paymentGatewayHashMap->put($org::allbinary::business::user::commerce::money::payment::gateway::PaymentGatewayData::SPECIAL2->toString(), $self->{special2});
            $paymentGatewayHashMap->put($org::allbinary::business::user::commerce::money::payment::gateway::PaymentGatewayData::SPECIAL3->toString(), $self->{special3});
            $paymentGatewayHashMap->put($org::allbinary::business::user::commerce::money::payment::gateway::PaymentGatewayData::SPECIAL4->toString(), $self->{special4});
            $paymentGatewayHashMap->put($org::allbinary::business::user::commerce::money::payment::gateway::PaymentGatewayData::SPECIAL5->toString(), $self->{special5});
            $paymentGatewayHashMap->put($org::allbinary::business::user::commerce::money::payment::gateway::PaymentGatewayData::SPECIAL6->toString(), $self->{special6});
            $paymentGatewayHashMap->put($org::allbinary::business::user::commerce::money::payment::gateway::PaymentGatewayData::SPECIAL7->toString(), $self->{special7});
            $paymentGatewayHashMap->put($org::allbinary::business::user::commerce::money::payment::gateway::PaymentGatewayData::SPECIAL8->toString(), $self->{special8});
            $paymentGatewayHashMap->put($org::allbinary::business::user::commerce::money::payment::gateway::PaymentGatewayData::SPECIAL9->toString(), $self->{special9});
        }
        $paymentGatewayHashMap->put('org::allbinary::business::entry::EntryData'->getInstance()->{LASTMODIFIED}->toString(), $self->{lastModified});
        return $paymentGatewayHashMap;
}


sub toVector {
    my ($self) = @_;
        return $self->toVector(1);
}


# Java overloaded method: Perl keeps the last definition
sub toVector {
    my ($self, $isEncrypted) = @_;
        my $updateVector = 'org::allbinary::util::BasicArrayListD'->new();
        $updateVector->add($self->{enable});
        $updateVector->add($self->{storeName});
        $updateVector->add($self->getName());
        $updateVector->add($self->{paymentMethod});
        $updateVector->add($self->{mode});
        $updateVector->add($self->{testProtocol});
        $updateVector->add($self->{testServer});
        $updateVector->add($self->{testPort});
        $updateVector->add($self->{testPath});
        $updateVector->add($self->{serverProtocol});
        $updateVector->add($self->{server});
        $updateVector->add($self->{serverPort});
        $updateVector->add($self->{serverPath});
        if ($isEncrypted) {
            my $superCrypt = 'org::allbinary::logic::control::crypt::SuperCrypt'->new($org::allbinary::business::user::commerce::money::payment::gateway::PaymentGatewayData::CRYPTNUM);
            $updateVector->add($superCrypt->encrypt($self->{userName}));
            $updateVector->add($superCrypt->encrypt($self->{password}));
        } else {
            $updateVector->add($self->{userName});
            $updateVector->add($self->{password});
        }
        $updateVector->add($self->{timeout});
        $updateVector->add($self->{proxyProtocol});
        $updateVector->add($self->{proxyServer});
        $updateVector->add($self->{proxyPort});
        $updateVector->add($self->{proxyPath});
        $updateVector->add($self->{proxyUserName});
        $updateVector->add($self->{proxyPassword});
        $updateVector->add($self->{proxyTimeout});
        if ($isEncrypted) {
            my $superCrypt = 'org::allbinary::logic::control::crypt::SuperCrypt'->new($org::allbinary::business::user::commerce::money::payment::gateway::PaymentGatewayData::CRYPTNUM);
            $updateVector->add($superCrypt->encrypt($self->{special1}));
            $updateVector->add($superCrypt->encrypt($self->{special2}));
            $updateVector->add($superCrypt->encrypt($self->{special3}));
            $updateVector->add($superCrypt->encrypt($self->{special4}));
            $updateVector->add($superCrypt->encrypt($self->{special5}));
            $updateVector->add($superCrypt->encrypt($self->{special6}));
            $updateVector->add($superCrypt->encrypt($self->{special7}));
            $updateVector->add($superCrypt->encrypt($self->{special8}));
            $updateVector->add($superCrypt->encrypt($self->{special9}));
        } else {
            $updateVector->add($self->{special1});
            $updateVector->add($self->{special2});
            $updateVector->add($self->{special3});
            $updateVector->add($self->{special4});
            $updateVector->add($self->{special5});
            $updateVector->add($self->{special6});
            $updateVector->add($self->{special7});
            $updateVector->add($self->{special8});
            $updateVector->add($self->{special9});
        }
        return $updateVector;
}


# throws Exception
sub getKey {
    my ($self) = @_;
        return 'org::allbinary::business::user::commerce::money::payment::gateway::PaymentGatewayPrimaryKey'->new($self->getStoreName(), $self->getName());
}

use java::util::HashMap;
use org::allbinary::util::BasicArrayList;
use org::allbinary::util::BasicArrayListD;
use org::allbinary::business::context::modules::storefront::StoreFrontData;
use org::allbinary::business::entry::EntryData;
use org::allbinary::business::user::UserData;
use org::allbinary::business::user::commerce::money::payment::PaymentData;
use org::allbinary::logic::StdUtil;
use org::allbinary::logic::control::crypt::SuperCrypt;
use org::allbinary::logic::string::StringUtil;
use org::allbinary::business::user::commerce::money::payment::gateway::PaymentGatewayInterface;
use org::allbinary::business::user::commerce::money::payment::gateway::PaymentGatewayData;
use org::allbinary::business::user::commerce::money::payment::gateway::PaymentGatewayPrimaryKey;

1;

