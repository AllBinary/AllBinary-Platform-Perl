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

# Java interface
package org::allbinary::business::user::commerce::money::payment::gateway::transaction::TransactionResultInterface;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';



sub toString {
    my ($self) = @_;
    die "abstract method toString";
}


sub getValues {
    my ($self) = @_;
    die "abstract method getValues";
}


sub getResult {
    my ($self) = @_;
    die "abstract method getResult";
}


sub getPnRef {
    my ($self) = @_;
    die "abstract method getPnRef";
}


sub getRespMsg {
    my ($self) = @_;
    die "abstract method getRespMsg";
}


sub getAvsAddr {
    my ($self) = @_;
    die "abstract method getAvsAddr";
}


sub getAvsZip {
    my ($self) = @_;
    die "abstract method getAvsZip";
}


sub getOrigResult {
    my ($self) = @_;
    die "abstract method getOrigResult";
}


sub getStatus {
    my ($self) = @_;
    die "abstract method getStatus";
}


sub getFraudCode {
    my ($self) = @_;
    die "abstract method getFraudCode";
}


sub getFraudMsg {
    my ($self) = @_;
    die "abstract method getFraudMsg";
}


sub getErrCode {
    my ($self) = @_;
    die "abstract method getErrCode";
}


sub getScore {
    my ($self) = @_;
    die "abstract method getScore";
}


sub getReason1 {
    my ($self) = @_;
    die "abstract method getReason1";
}


sub getReason2 {
    my ($self) = @_;
    die "abstract method getReason2";
}


sub getReason3 {
    my ($self) = @_;
    die "abstract method getReason3";
}


sub getException1 {
    my ($self) = @_;
    die "abstract method getException1";
}


sub getException2 {
    my ($self) = @_;
    die "abstract method getException2";
}


sub getException3 {
    my ($self) = @_;
    die "abstract method getException3";
}


sub getException4 {
    my ($self) = @_;
    die "abstract method getException4";
}


sub getException5 {
    my ($self) = @_;
    die "abstract method getException5";
}


sub getException6 {
    my ($self) = @_;
    die "abstract method getException6";
}


sub getException7 {
    my ($self) = @_;
    die "abstract method getException7";
}

use org::allbinary::util::BasicArrayList;
use org::allbinary::util::BasicArrayListD;

1;

