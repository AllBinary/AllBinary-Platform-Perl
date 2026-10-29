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

package org::allbinary::logic::communication::http::request::AbeHttpRequestInfo;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';


sub _init_fields {
    my ($self) = @_;
    $self->{NAME} = "AbeHttpRequestInfo";
    $self->{abeHttpRequestInfoData} = 'org::allbinary::logic::communication::http::request::AbeHttpRequestInfoData'->getInstance();
    $self->{commonSeps} = 'org::allbinary::string::CommonSeps'->getInstance();
    $self->{httpUserAgent} = undef;
    $self->{remoteAddress} = undef;
    $self->{remoteHost} = undef;
    $self->{remoteHostByAddr} = undef;
    $self->{remotePort} = undef;
    $self->{requestedFilePath} = undef;
}

sub new {
    my ($class, @arguments) = @_;
    return $class->_new1(@arguments) if scalar(@arguments) == 1;
    return $class->_new1(@arguments) if scalar(@arguments) == 1;
    die "No constructor of AbeHttpRequestInfo takes " . scalar(@arguments) . " arguments";
}


sub _new1 {
    my ($class, $hashMap) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
        my $stringUtil = 'org::allbinary::logic::string::StringUtil'->getInstance();
        $self->{httpUserAgent} = $stringUtil->getNonNull($hashMap->get($self->{abeHttpRequestInfoData}->{HTTP_USER_AGENT}));
        $self->{remoteAddress} = $stringUtil->getNonNull($hashMap->get($self->{abeHttpRequestInfoData}->{REMOTE_ADDRESS}));
        $self->{remoteHost} = $stringUtil->getNonNull($hashMap->get($self->{abeHttpRequestInfoData}->{REMOTE_HOST}));
        $self->{remoteHostByAddr} = $stringUtil->getNonNull($hashMap->get($self->{abeHttpRequestInfoData}->{REMOTE_HOST_BY_ADDRESS}));
        $self->{remotePort} = $stringUtil->getNonNull($hashMap->get($self->{abeHttpRequestInfoData}->{REMOTE_PORT}));
        $self->{requestedFilePath} = $stringUtil->getNonNull($hashMap->get($self->{abeHttpRequestInfoData}->{REQUEST_FILE_PATH}));
    return $self;
}


sub _new1 {
    my ($class, $httpServletRequest) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
        my $stringUtil = 'org::allbinary::logic::string::StringUtil'->getInstance();
        $self->{httpUserAgent} = $stringUtil->{EMPTY_STRING};
        my $enumuration = $httpServletRequest->getHeaderNames();
        while ($enumuration->hasMoreElements()) {
            my $key = $enumuration->nextElement();
            my $value = $httpServletRequest->getHeader($key);
            if (index($key, "user") >= 0) {
                $self->{httpUserAgent} = "key: " . $key . " value: " . $value;
            }
        }
        $self->{remoteHostByAddr} = $stringUtil->{EMPTY_STRING};
        $self->{remoteAddress} = $httpServletRequest->getRemoteAddr();
        $self->{remoteHost} = $httpServletRequest->getRemoteHost();
        $self->{requestedFilePath} = $httpServletRequest->getServletPath();
        $self->{remotePort} = ("" . ($httpServletRequest->getRemotePort()));
    return $self;
}


sub toHashMap {
    my ($self) = @_;
        my $hashMap = 'org::allbinary::logic::StdUtil'->getInstance()->createHashMap();
        $hashMap->put($self->{abeHttpRequestInfoData}->{HTTP_USER_AGENT}, $self->{httpUserAgent});
        $hashMap->put($self->{abeHttpRequestInfoData}->{REMOTE_ADDRESS}, $self->{remoteAddress});
        $hashMap->put($self->{abeHttpRequestInfoData}->{REMOTE_HOST}, $self->{remoteHost});
        $hashMap->put($self->{abeHttpRequestInfoData}->{REMOTE_HOST_BY_ADDRESS}, $self->{remoteHostByAddr});
        $hashMap->put($self->{abeHttpRequestInfoData}->{REMOTE_PORT}, $self->{remotePort});
        $hashMap->put($self->{abeHttpRequestInfoData}->{REQUEST_FILE_PATH}, $self->{requestedFilePath});
        return $hashMap;
}


sub toVector {
    my ($self) = @_;
        my $vector = 'org::allbinary::util::BasicArrayListD'->new();
        $vector->add($self->{httpUserAgent});
        $vector->add($self->{remoteAddress});
        $vector->add($self->{remoteHost});
        $vector->add($self->{remoteHostByAddr});
        $vector->add($self->{remotePort});
        $vector->add($self->{requestedFilePath});
        return $vector;
}


sub toString {
    my ($self) = @_;
        return 'org::allbinary::logic::string::StringMaker'->new()->append($self->{NAME})->append($self->{commonSeps}->{COLON_SEP})->append($self->{abeHttpRequestInfoData}->{HTTP_USER_AGENT})->append($self->{commonSeps}->{COLON_SEP})->append($self->{httpUserAgent})->append($self->{commonSeps}->{SPACE})->append($self->{abeHttpRequestInfoData}->{REMOTE_ADDRESS})->append($self->{commonSeps}->{COLON_SEP})->append($self->{remoteAddress})->append($self->{commonSeps}->{SPACE})->append($self->{abeHttpRequestInfoData}->{REMOTE_HOST})->append($self->{commonSeps}->{COLON_SEP})->append($self->{remoteHost})->append($self->{commonSeps}->{SPACE})->append($self->{abeHttpRequestInfoData}->{REMOTE_HOST_BY_ADDRESS})->append($self->{commonSeps}->{COLON_SEP})->append($self->{remoteHostByAddr})->append($self->{commonSeps}->{SPACE})->append($self->{abeHttpRequestInfoData}->{REMOTE_PORT})->append($self->{commonSeps}->{COLON_SEP})->append($self->{remotePort})->append($self->{commonSeps}->{SPACE})->append($self->{abeHttpRequestInfoData}->{REQUEST_FILE_PATH})->append($self->{commonSeps}->{COLON_SEP})->append($self->{requestedFilePath})->toString();
}

use java::util::Enumeration;
use java::util::HashMap;
use org::allbinary::util::BasicArrayList;
use org::allbinary::util::BasicArrayListD;
# use javax::servlet::http::HttpServletRequest;
use org::allbinary::logic::StdUtil;
use org::allbinary::logic::string::StringMaker;
use org::allbinary::logic::string::StringUtil;
use org::allbinary::string::CommonSeps;
use org::allbinary::logic::communication::http::request::AbeHttpRequestInfoData;

1;

